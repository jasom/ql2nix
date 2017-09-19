
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-secure-read, 
   lisp_yaclanapht, lisp_rutils, lisp_defmacro-enhance,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_yaclanapht lisp_rutils lisp_defmacro-enhance  ];
      inherit stdenv;
      systemName = "cl-secure-read";
      
      sourceProject = "${lisp-project_cl-secure-read}";
      patches = [];
      lisp_dependencies = "${lisp_yaclanapht} ${lisp_rutils} ${lisp_defmacro-enhance}";
      name = "lisp_cl-secure-read-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
