
{ buildLispPackage, stdenv, fetchurl, lisp-project_city-hash, 
   lisp_com-google-base, lisp_nibbles, lisp_swap-bytes,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-google-base lisp_nibbles lisp_swap-bytes  ];
      inherit stdenv;
      systemName = "city-hash";
      
      sourceProject = "${lisp-project_city-hash}";
      patches = [];
      lisp_dependencies = "${lisp_com-google-base} ${lisp_nibbles} ${lisp_swap-bytes}";
      name = "lisp_city-hash-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
