require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EditionsController do

  def mock_edition(stubs={})
    @mock_edition ||= mock_model(Edition, stubs)
  end

  describe "GET index" do
    it "assigns all editions as @editions" do
      Edition.stub!(:find).with(:all).and_return([mock_edition])
      get :index
      assigns[:editions].should == [mock_edition]
    end
  end

  describe "GET show" do
    it "assigns the requested edition as @edition" do
      Edition.stub!(:find).with("37").and_return(mock_edition)
      get :show, :id => "37"
      assigns[:edition].should equal(mock_edition)
    end
  end

  describe "GET new" do
    it "assigns a new edition as @edition" do
      Edition.stub!(:new).and_return(mock_edition)
      get :new
      assigns[:edition].should equal(mock_edition)
    end
  end

  describe "GET edit" do
    it "assigns the requested edition as @edition" do
      Edition.stub!(:find).with("37").and_return(mock_edition)
      get :edit, :id => "37"
      assigns[:edition].should equal(mock_edition)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created edition as @edition" do
        Edition.stub!(:new).with({'these' => 'params'}).and_return(mock_edition(:save => true))
        post :create, :edition => {:these => 'params'}
        assigns[:edition].should equal(mock_edition)
      end

      it "redirects to the created edition" do
        Edition.stub!(:new).and_return(mock_edition(:save => true))
        post :create, :edition => {}
        response.should redirect_to(edition_url(mock_edition))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved edition as @edition" do
        Edition.stub!(:new).with({'these' => 'params'}).and_return(mock_edition(:save => false))
        post :create, :edition => {:these => 'params'}
        assigns[:edition].should equal(mock_edition)
      end

      it "re-renders the 'new' template" do
        Edition.stub!(:new).and_return(mock_edition(:save => false))
        post :create, :edition => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested edition" do
        Edition.should_receive(:find).with("37").and_return(mock_edition)
        mock_edition.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :edition => {:these => 'params'}
      end

      it "assigns the requested edition as @edition" do
        Edition.stub!(:find).and_return(mock_edition(:update_attributes => true))
        put :update, :id => "1"
        assigns[:edition].should equal(mock_edition)
      end

      it "redirects to the edition" do
        Edition.stub!(:find).and_return(mock_edition(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(edition_url(mock_edition))
      end
    end

    describe "with invalid params" do
      it "updates the requested edition" do
        Edition.should_receive(:find).with("37").and_return(mock_edition)
        mock_edition.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :edition => {:these => 'params'}
      end

      it "assigns the edition as @edition" do
        Edition.stub!(:find).and_return(mock_edition(:update_attributes => false))
        put :update, :id => "1"
        assigns[:edition].should equal(mock_edition)
      end

      it "re-renders the 'edit' template" do
        Edition.stub!(:find).and_return(mock_edition(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested edition" do
      Edition.should_receive(:find).with("37").and_return(mock_edition)
      mock_edition.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the editions list" do
      Edition.stub!(:find).and_return(mock_edition(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(editions_url)
    end
  end

end
