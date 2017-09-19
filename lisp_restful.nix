
{ buildLispPackage, stdenv, fetchurl, lisp-project_restful, 
   lisp_closer-mop, lisp_jonathan, lisp_hunchentoot,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_jonathan lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "restful";
      
      sourceProject = "${lisp-project_restful}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_jonathan} ${lisp_hunchentoot}";
      name = "lisp_restful-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
