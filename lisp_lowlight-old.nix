
{ buildLispPackage, stdenv, fetchurl, lisp-project_lowlight, 
   lisp_cl-who, lisp_spinneret, lisp_alexandria, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-who lisp_spinneret lisp_alexandria lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "lowlight.old";
      
      sourceProject = "${lisp-project_lowlight}";
      patches = [];
      lisp_dependencies = "${lisp_cl-who} ${lisp_spinneret} ${lisp_alexandria} ${lisp_cl-ppcre}";
      name = "lisp_lowlight-old-20131211-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
