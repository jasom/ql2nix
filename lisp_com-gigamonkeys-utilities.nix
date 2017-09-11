
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-utilities, 
   lisp_alexandria, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_split-sequence  ];
      inherit stdenv;
      systemName = "com.gigamonkeys.utilities";
      
      sourceProject = "${lisp-project_monkeylib-utilities}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_split-sequence}";
      name = "lisp_com-gigamonkeys-utilities-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
