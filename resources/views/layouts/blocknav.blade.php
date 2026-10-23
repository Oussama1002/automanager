<style>
.blocknav{
  position: fixed;
  width: 70px;
  margin-top: 150px;
  transition: all 0.3s linear;
  z-index: 111111;
}
.blocknav li{
  height: 60px;
  position:relative;
}
.blocknav li a{
  color: white !important;
  display: block;
  height: 100%;
  width: 100%;
  line-height: 60px;
  padding-left:25%;
  transition: all .3s linear;
}
.blocknav li:nth-child(1) a, .blocknav li:nth-child(3) a, .blocknav li:nth-child(5) a{
  background: #1f519b !important;
}
.blocknav li:nth-child(2) a, .blocknav li:nth-child(4) a{
  background: #fdd64d !important;
}
.blocknav li a i{
  position:absolute;
  top: 25%;
  left: 20px;
  font-size: 27px;
}
.blocknav ul li a span{
  display: none;
  font-weight: bold;
  letter-spacing: 1px;
  text-transform: uppercase;
}
.blocknav a:hover {
  z-index:1;
  width: 220px;
  box-shadow: 0 0 1px 1px rgba(0,0,0,.3);
}
.blocknav ul li:hover a span{
  padding-left: 30%;
  display: block;
  color: white !important;
}
#myModalMap, #myModalContact{
    z-index:1111111;
}
@media only screen and (max-width:767px) {
    .blocknav li a i{
      top: 60%;
    }
}
</style>
<!-- <nav class="blocknav">
    <ul>
        <li><a href="{{ route('vente.index') }}"><i class="fas fa-calendar-alt"></i><span>Rendez-vous</span></a></li>
        <li><a href="{{ route('reprise.index') }}"><i class="fas fa-toolbox"></i><span>Service</span></a></li>
        <li><a href="#" data-toggle="modal" data-target="#myModalContact"><i class="fas fa-envelope"></i><span>Contact</span></a></li>
        <li><a href="#" data-toggle="modal" data-target="#myModalMap"><i class="fas fa-map-marker-alt"></i><span>Localisation</span></a></li>
        <li><a href="tel:+212808631836" ><i class="fas fa-phone"></i><span style="font-size:14px;">+212 808 631 836</span></a></li>
    </ul>
</nav> -->

<div id="myModalMap" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-white">Localisation</h4>
      </div>
      <div class="modal-body">
           <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d831.497999123923!2d-7.607901806936464!3d33.527593717096664!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xda62d2b43f5fa89%3A0x4a08c15bb60afbf5!2sNADO.ma%20-%20Auto%20Ench%C3%A8re!5e0!3m2!1sfr!2sma!4v1704650848180!5m2!1sfr!2sma" style="border:0; width:100%; height:450px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div id="myModalContact" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-white">Ecrivez-nous</h4>
      </div>
      <div class="modal-body">
           @if (session('success'))
                <div class="FormMsg">
                    <div class="alert alert-success no-bg"> {{ session('success') }} </div>
                </div>
            @endif
            <form method="post" class="Form" action="{{ route('contactez-nous.store') }}">
            @csrf
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <div class="input-group">
                                <input name="name" type="text" required class="form-control" placeholder="Nom">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <div class="input-group">
                                <input name="email" type="email" class="form-control" required  placeholder="Email" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <div class="input-group">
                                <input name="phone" type="text" required class="form-control" placeholder="Téléphone">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <div class="input-group">
                                <input name="subject" type="text" required class="form-control" placeholder="Sujet">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="input-group">
                                <textarea name="message" rows="4" class="form-control" required placeholder="Message..."></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 text-center">
                        <button name="submit" type="submit" value="Submit" class="site-button ">
                            <span>
                                Envoyer le message
                            </span>
                        </button>
                    </div>
                </div>
            </form>
      </div>
    </div>
  </div>
</div>