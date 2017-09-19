
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-yaclyaml, 
   lisp_parse-number, lisp_esrap-liquid, lisp_cl-interpol, lisp_cl-test-more, lisp_rutils, lisp_iterate,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parse-number lisp_esrap-liquid lisp_cl-interpol lisp_cl-test-more lisp_rutils lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-yaclyaml";
      
      sourceProject = "${lisp-project_cl-yaclyaml}";
      patches = [];
      lisp_dependencies = "${lisp_parse-number} ${lisp_esrap-liquid} ${lisp_cl-interpol} ${lisp_cl-test-more} ${lisp_rutils} ${lisp_iterate}";
      name = "lisp_cl-yaclyaml-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
