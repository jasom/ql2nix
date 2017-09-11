
{ buildLispPackage, stdenv, fetchurl, lisp-project_zenekindarl, 
   lisp_flexi-streams, lisp_prove, lisp_zenekindarl,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_prove lisp_zenekindarl  ];
      inherit stdenv;
      systemName = "zenekindarl-test";
      
      sourceProject = "${lisp-project_zenekindarl}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_prove} ${lisp_zenekindarl}";
      name = "lisp_zenekindarl-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
