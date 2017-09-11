
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-online-learning, 
   lisp_parse-number, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parse-number lisp_split-sequence  ];
      inherit stdenv;
      systemName = "cl-online-learning";
      
      sourceProject = "${lisp-project_cl-online-learning}";
      patches = [];
      lisp_dependencies = "${lisp_parse-number} ${lisp_split-sequence}";
      name = "lisp_cl-online-learning-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
