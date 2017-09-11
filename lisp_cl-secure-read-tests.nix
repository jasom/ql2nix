
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-secure-read, 
   lisp_cl-secure-read, lisp_fiveam,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-secure-read lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-secure-read/tests";
      
      sourceProject = "${lisp-project_cl-secure-read}";
      patches = [];
      lisp_dependencies = "${lisp_cl-secure-read} ${lisp_fiveam}";
      name = "lisp_cl-secure-read-tests-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
