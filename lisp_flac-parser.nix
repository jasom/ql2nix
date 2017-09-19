
{ buildLispPackage, stdenv, fetchurl, lisp-project_flac-parser, 
   lisp_bit-smasher, lisp_fast-io, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bit-smasher lisp_fast-io lisp_alexandria  ];
      inherit stdenv;
      systemName = "flac-parser";
      
      sourceProject = "${lisp-project_flac-parser}";
      patches = [];
      lisp_dependencies = "${lisp_bit-smasher} ${lisp_fast-io} ${lisp_alexandria}";
      name = "lisp_flac-parser-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
