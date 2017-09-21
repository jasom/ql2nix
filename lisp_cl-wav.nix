
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-wav, 
   lisp_cl-riff, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-riff lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-wav";
      
      sourceProject = "${lisp-project_cl-wav}";
      patches = [];
      lisp_dependencies = "${lisp_cl-riff} ${lisp_alexandria}";
      name = "lisp_cl-wav-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }