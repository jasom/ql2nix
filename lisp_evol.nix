
{ buildLispPackage, stdenv, fetchurl, lisp-project_evol, 
   lisp_patron, lisp_unix-options, lisp_cl-ppcre, lisp_cl-fad, lisp_external-program,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_patron lisp_unix-options lisp_cl-ppcre lisp_cl-fad lisp_external-program  ];
      inherit stdenv;
      systemName = "evol";
      
      sourceProject = "${lisp-project_evol}";
      patches = [];
      lisp_dependencies = "${lisp_patron} ${lisp_unix-options} ${lisp_cl-ppcre} ${lisp_cl-fad} ${lisp_external-program}";
      name = "lisp_evol-20101006-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
