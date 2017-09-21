
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cuda, 
   lisp_imago, lisp_cl-ppcre, lisp_cl-reexport, lisp_split-sequence, lisp_cl-pattern, lisp_osicat, lisp_external-program, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_imago lisp_cl-ppcre lisp_cl-reexport lisp_split-sequence lisp_cl-pattern lisp_osicat lisp_external-program lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "cl-cuda-examples";
      
      sourceProject = "${lisp-project_cl-cuda}";
      patches = [];
      lisp_dependencies = "${lisp_imago} ${lisp_cl-ppcre} ${lisp_cl-reexport} ${lisp_split-sequence} ${lisp_cl-pattern} ${lisp_osicat} ${lisp_external-program} ${lisp_cffi-grovel}";
      name = "lisp_cl-cuda-examples-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
