
{ buildLispPackage, stdenv, fetchurl, lisp-project_clot, 
   lisp_cl-gd, lisp_sclf,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gd lisp_sclf  ];
      inherit stdenv;
      systemName = "clot";
      
      sourceProject = "${lisp-project_clot}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gd} ${lisp_sclf}";
      name = "lisp_clot-20150207T211923";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
