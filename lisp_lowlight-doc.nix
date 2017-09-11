
{ buildLispPackage, stdenv, fetchurl, lisp-project_lowlight, 
   lisp_cl-gendoc, lisp_lowlight, lisp_lowlight-tests,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gendoc lisp_lowlight lisp_lowlight-tests  ];
      inherit stdenv;
      systemName = "lowlight.doc";
      
      sourceProject = "${lisp-project_lowlight}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gendoc} ${lisp_lowlight} ${lisp_lowlight-tests}";
      name = "lisp_lowlight-doc-20131211-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
