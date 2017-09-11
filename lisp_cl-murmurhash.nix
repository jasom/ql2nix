
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-murmurhash, 
   lisp_babel,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel  ];
      inherit stdenv;
      systemName = "cl-murmurhash";
      
      sourceProject = "${lisp-project_cl-murmurhash}";
      patches = [];
      lisp_dependencies = "${lisp_babel}";
      name = "lisp_cl-murmurhash-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
