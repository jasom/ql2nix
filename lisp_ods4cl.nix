
{ buildLispPackage, stdenv, fetchurl, lisp-project_ods4cl, 
   lisp_sclf,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_sclf  ];
      inherit stdenv;
      systemName = "ods4cl";
      
      sourceProject = "${lisp-project_ods4cl}";
      patches = [];
      lisp_dependencies = "${lisp_sclf}";
      name = "lisp_ods4cl-20101006-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
