
{ buildLispPackage, stdenv, fetchurl, lisp-project_cobstor, 
   lisp_cobstor, lisp_rt, lisp_sclf,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cobstor lisp_rt lisp_sclf  ];
      inherit stdenv;
      systemName = "cobstor-tests";
      
      sourceProject = "${lisp-project_cobstor}";
      patches = [];
      lisp_dependencies = "${lisp_cobstor} ${lisp_rt} ${lisp_sclf}";
      name = "lisp_cobstor-tests-20150207T212348";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
