<?php

define('PROTECTED_IMAGE_PATH', base_path().'/'.'protected_images');
use Illuminate\Filesystem;

class admin_ConceptController extends \BaseController {
	protected $layout = 'layouts.admin';


	public function index($survey_id, $concept_id)
	{
		$concept = Concept::find($concept_id);
		if ($concept && $concept->survey_id == $survey_id) {
			return self::concept_form($concept, $survey_id);
		}else{
			App::abort(500, 'Error fetching concept.');
		}
	}

	public function create($survey_id)
	{
		return self::concept_form(null, $survey_id);
	}

	private function concept_form($concept = null, $survey_id)
	{
        $sid     = (isset($concept->id)) ? $concept->survey_id : $survey_id;
        $survey  = Survey::find($sid);

        if(isset($concept->id)){
            $concept = Concept::find($concept->id);
            if($concept->name) return View::make('admin/concept', compact(array('concept', 'survey')));
        }

        $concept    = new Concept;
        $concept->survey_id = $survey_id;
        return View::make('admin/concept', compact(array('concept', 'survey')));
	}

	public function save($survey_id, $concept_id = null)
	{
		$input = Input::all();

		if (isset($concept_id)){
			$concept = Concept::find($concept_id);
			if ($concept && $concept->survey_id == $survey_id) {
				$concept->fill($input);

                //Validator::make(Array Input, Array [field => rule1 | rule2])
                $validator  = Validator::make($input, array(
                    'name'          => 'required',
                    'html'   => 'required'
                ));
                if($validator->fails()){
                    $messages = '';
                    $errors = $validator->errors()->getMessages();
                    foreach($errors as $elem):
                        foreach($elem as $idx => $error):
                            $messages .= $error;
                        endforeach;
                    endforeach;
                    return Redirect::to('admin/surveys/' . $survey_id .'/concepts/create')->with('flash_message', 'Could not create concept. '.$messages);
                }

                $concept->save();
				return Redirect::to('admin/surveys/' . $survey_id .'/concepts/create');
			}else{
				App::abort(500, 'Error fetching concept.');
			}
		}else{
            $validator  = Validator::make($input, array(
                'name'          => 'required',
                'html'   => 'required'
            ));
            if($validator->fails()){
                $messages = '';
                $errors = $validator->errors()->getMessages();
                foreach($errors as $elem):
                    foreach($elem as $idx => $error):
                        $messages .= $error;
                    endforeach;
                endforeach;
                return Redirect::to('admin/surveys/' . $survey_id .'/concepts/create')->with('flash_message', 'Could not create concept. '.$messages);
            }

			$concept = new Concept;
			$concept->fill($input);
			$concept->survey_id = $survey_id;
			$concept->save();
            return Redirect::to('admin/surveys/' . $survey_id .'/concepts/create');
		}
	}

    public function saveAndStay($survey_id, $concept_id = null)
    {
        $input = Input::all();

        if (isset($concept_id)){
            $concept = Concept::find($concept_id);
            if ($concept && $concept->survey_id == $survey_id) {
                $concept->fill($input);

                //Validator::make(Array Input, Array [field => rule1 | rule2])
                $validator  = Validator::make($input, array(
                    'name'          => 'required',
                    'html'   => 'required'
                ));
                if($validator->fails()){
                    $messages = '';
                    $errors = $validator->errors()->getMessages();
                    foreach($errors as $elem):
                        foreach($elem as $idx => $error):
                            $messages .= $error;
                        endforeach;
                    endforeach;
                    return Redirect::to('admin/surveys/' . $survey_id .'/concepts/create')->with('flash_message', 'Could not create concept. '.$messages);
                }

                $concept->save();
                return Redirect::to('admin/surveys/' . $survey_id .'/concepts/'.$concept_id)->with('flash_message', 'Concept Saved');
            }else{
                App::abort(500, 'Error fetching concept.');
            }
        }else{
            $validator  = Validator::make($input, array(
                'name'          => 'required',
                'html'   => 'required'
            ));
            if($validator->fails()){
                $messages = '';
                $errors = $validator->errors()->getMessages();
                foreach($errors as $elem):
                    foreach($elem as $idx => $error):
                        $messages .= $error;
                    endforeach;
                endforeach;
                return Redirect::to('admin/surveys/' . $survey_id .'/concepts/create')->with('flash_message', 'Could not create concept. '.$messages);
            }

            $concept = new Concept;
            $concept->fill($input);
            $concept->survey_id = $survey_id;
            $concept->save();
            return Redirect::to('admin/surveys/' . $survey_id .'/concepts')->with('flash_message', 'Concept Saved');
        }
    }

	public function delete($survey_id, $concept_id)
	{
		$concept = Concept::find($concept_id);
		if ($concept && $concept->survey_id == $survey_id) {
			$concept->delete();
			return Redirect::to('admin/surveys/' . $survey_id);
		}else{
			App::abort(500, 'Error fetching concept.');
		}
	}

    public function upload($survey_id){
        $s = Survey::find($survey_id);
        $survey_name = str_replace(' ', '', $s->name);

        $input = Input::all();
        $image = $input['file'];

        if($image){
            $dir = PROTECTED_IMAGE_PATH.'/'.$survey_name;
            if(! is_dir($dir)){
                mkdir($dir);
            }

            //$upload_path = $dir.'/'.$image->getClientOriginalName();
            $image->move($dir, $image->getClientOriginalName());

            return "image moved to: ".$dir;
        }

        return 'uploading';
    }

    public function getFiles(){
        $home   = url('/');
        $dir    = Input::get('directory');
        $path   = PROTECTED_IMAGE_PATH.'/'.$dir;

        $files = File::files($path);                                //Get the path based off the File System
        $host_specific_path = $this->normalizeUploadDir($files);    //Translate those paths to url friendly paths ( based on the host )

        return $host_specific_path;
    }

    public function normalizeUploadDir($path){

        switch(exec('hostname')){
            case 'Production':
                $path = preg_replace('/\/var\/www\/intengoresearch.com\/releases\/[0-9]*\/protected_images/', './usrimg/', $path);
                return $path;
            break;

            case 'precise32':
                $path = str_replace('/var/www/protected_images/', './usrimg/', $path);
                return $path;
            break;
        }
    }

    public function duplicate($survey_id, $concept_id)
    {
        $concept = Concept::find($concept_id);
        $newC     = new Concept;
        $attrs    = $concept->getAttributes();
        unset($attrs['id']);
        $newC->fill($attrs);
        $newC->survey_id = $concept->survey_id;
        if($newC->save()) return $newC;
        return 0;
    }
}