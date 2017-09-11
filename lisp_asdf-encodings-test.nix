
{ buildLispPackage, stdenv, fetchurl, lisp-project_asdf-encodings, 
   lisp_asdf-encodings, lisp_fare-utils, lisp_hu-dwim-stefil,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_asdf-encodings lisp_fare-utils lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "asdf-encodings/test";
      
      sourceProject = "${lisp-project_asdf-encodings}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-encodings} ${lisp_fare-utils} ${lisp_hu-dwim-stefil}";
      name = "lisp_asdf-encodings-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
