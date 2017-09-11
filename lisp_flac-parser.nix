
{ buildLispPackage, stdenv, fetchurl, lisp-project_flac-parser, 
   lisp_alexandria, lisp_babel, lisp_bit-smasher, lisp_fast-io,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_babel lisp_bit-smasher lisp_fast-io  ];
      inherit stdenv;
      systemName = "flac-parser";
      
      sourceProject = "${lisp-project_flac-parser}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_babel} ${lisp_bit-smasher} ${lisp_fast-io}";
      name = "lisp_flac-parser-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
