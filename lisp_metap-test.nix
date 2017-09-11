
{ buildLispPackage, stdenv, fetchurl, lisp-project_metap, 
   lisp_fiveam, lisp_metap,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_metap  ];
      inherit stdenv;
      systemName = "metap-test";
      
      sourceProject = "${lisp-project_metap}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_metap}";
      name = "lisp_metap-test-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
