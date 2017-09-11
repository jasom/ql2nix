
{ buildLispPackage, stdenv, fetchurl, lisp-project_restful, 
   lisp_drakma, lisp_prove, lisp_prove-asdf, lisp_restful,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_prove lisp_prove-asdf lisp_restful  ];
      inherit stdenv;
      systemName = "restful-test";
      
      sourceProject = "${lisp-project_restful}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_prove} ${lisp_prove-asdf} ${lisp_restful}";
      name = "lisp_restful-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
