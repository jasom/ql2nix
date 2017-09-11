
{ buildLispPackage, stdenv, fetchurl, lisp-project_fomus, 
   
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "fomus";
      
      sourceProject = "${lisp-project_fomus}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_fomus-20120909-svn";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
