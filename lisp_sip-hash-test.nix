
{ buildLispPackage, stdenv, fetchurl, lisp-project_sip-hash, 
   lisp_hu-dwim-stefil, lisp_sip-hash,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-stefil lisp_sip-hash  ];
      inherit stdenv;
      systemName = "sip-hash-test";
      
      sourceProject = "${lisp-project_sip-hash}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-stefil} ${lisp_sip-hash}";
      name = "lisp_sip-hash-test-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
