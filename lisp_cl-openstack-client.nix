
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-openstack-client, 
   lisp_uri-template, lisp_local-time, lisp_cl-json, lisp_drakma,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_uri-template lisp_local-time lisp_cl-json lisp_drakma  ];
      inherit stdenv;
      systemName = "cl-openstack-client";
      
      sourceProject = "${lisp-project_cl-openstack-client}";
      patches = [];
      lisp_dependencies = "${lisp_uri-template} ${lisp_local-time} ${lisp_cl-json} ${lisp_drakma}";
      name = "lisp_cl-openstack-client-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
