
{ buildLispPackage, stdenv, fetchurl, lisp-project_oclcl, 
   lisp_cl-ppcre, lisp_cl-reexport, lisp_split-sequence, lisp_cl-pattern, lisp_osicat, lisp_external-program, lisp_cffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_cl-reexport lisp_split-sequence lisp_cl-pattern lisp_osicat lisp_external-program lisp_cffi  ];
      inherit stdenv;
      systemName = "oclcl";
      
      sourceProject = "${lisp-project_oclcl}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_cl-reexport} ${lisp_split-sequence} ${lisp_cl-pattern} ${lisp_osicat} ${lisp_external-program} ${lisp_cffi}";
      name = "lisp_oclcl-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
