
{ buildLispPackage, stdenv, fetchurl, lisp-project_eco, 
   lisp_cl-who, lisp_split-sequence, lisp_esrap,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-who lisp_split-sequence lisp_esrap  ];
      inherit stdenv;
      systemName = "eco";
      
      sourceProject = "${lisp-project_eco}";
      patches = [];
      lisp_dependencies = "${lisp_cl-who} ${lisp_split-sequence} ${lisp_esrap}";
      name = "lisp_eco-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
