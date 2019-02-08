<?php


namespace App\Http\Controllers\API;


use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Films;
use Validator;


class ProductController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $films = Films::all();


        return $this->sendResponse($films->toArray(), 'Data retrieved successfully.');
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input = $request->all();


        $validator = Validator::make($input, [
            'name' => 'required',
            'description' => 'required',
            'release_date' => 'required',
            'rating' => 'required',
            'ticket_price' => 'required',
            'country' => 'required',
            'name' => 'required',
            'genre' => 'required',
            'photo' => 'required',
        ]);


        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }


        $films = Films::create($input);


        return $this->sendResponse($films->toArray(), 'Data inserted successfully.');
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $films = Films::find($id);


        if (is_null($films)) {
            return $this->sendError('Data not found.');
        }


        return $this->sendResponse($films->toArray(), 'Data retrieved successfully.');
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Films $films)
    {
        $input = $request->all();


        $validator = Validator::make($input, [
            'name' => 'required',
            'description' => 'required',
            'release_date' => 'required',
            'rating' => 'required',
            'ticket_price' => 'required',
            'country' => 'required',
            'name' => 'required',
            'genre' => 'required',
            'photo' => 'required',
        ]);


        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }


        $films->name = $input['name'];
        $films->description = $input['description'];
        $films->release_date = $input['release_date'];
        $films->rating = $input['rating'];
        $films->ticket_price = $input['ticket_price'];
        $films->country = $input['country'];
        $films->genre = $input['genre'];
        $films->photo = $input['photo'];
        $films->update();


        return $this->sendResponse($films->toArray(), 'Data updated successfully.');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Films $films)
    {
        $films->delete();


        return $this->sendResponse($films->toArray(), 'Data deleted successfully.');
    }
}