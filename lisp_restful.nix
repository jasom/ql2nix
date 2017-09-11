
{ buildLispPackage, stdenv, fetchurl, lisp-project_restful, 
   lisp_alexandria, lisp_cl-ppcre, lisp_closer-mop, lisp_hunchentoot, lisp_jonathan,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_closer-mop lisp_hunchentoot lisp_jonathan  ];
      inherit stdenv;
      systemName = "restful";
      
      sourceProject = "${lisp-project_restful}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_closer-mop} ${lisp_hunchentoot} ${lisp_jonathan}";
      name = "lisp_restful-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
