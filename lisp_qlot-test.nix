
{ buildLispPackage, stdenv, fetchurl, lisp-project_qlot, 
   lisp_prove, lisp_prove-asdf, lisp_qlot, lisp_split-sequence, lisp_archive, lisp_salza2, lisp_gzip-stream, lisp_dexador, lisp_yason,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove lisp_prove-asdf lisp_qlot lisp_split-sequence lisp_archive lisp_salza2 lisp_gzip-stream lisp_dexador lisp_yason  ];
      inherit stdenv;
      systemName = "qlot-test";
      
      sourceProject = "${lisp-project_qlot}";
      patches = [];
      lisp_dependencies = "${lisp_prove} ${lisp_prove-asdf} ${lisp_qlot} ${lisp_split-sequence} ${lisp_archive} ${lisp_salza2} ${lisp_gzip-stream} ${lisp_dexador} ${lisp_yason}";
      name = "lisp_qlot-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
