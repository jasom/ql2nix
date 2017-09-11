
{ buildLispPackage, stdenv, fetchurl, lisp-project_sip-hash, 
   lisp_com-google-base, lisp_nibbles,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-google-base lisp_nibbles  ];
      inherit stdenv;
      systemName = "sip-hash";
      
      sourceProject = "${lisp-project_sip-hash}";
      patches = [];
      lisp_dependencies = "${lisp_com-google-base} ${lisp_nibbles}";
      name = "lisp_sip-hash-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
