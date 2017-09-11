
{ buildLispPackage, stdenv, fetchurl, lisp-project_chillax, 
   lisp_chillax-core, lisp_yason,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_chillax-core lisp_yason  ];
      inherit stdenv;
      systemName = "chillax.yason";
      
      sourceProject = "${lisp-project_chillax}";
      patches = [];
      lisp_dependencies = "${lisp_chillax-core} ${lisp_yason}";
      name = "lisp_chillax-yason-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
