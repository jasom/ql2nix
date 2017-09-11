
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-marklogic, 
   lisp_alexandria, lisp_drakma, lisp_fiveam, lisp_local-time,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_drakma lisp_fiveam lisp_local-time  ];
      inherit stdenv;
      systemName = "cl-marklogic";
      
      sourceProject = "${lisp-project_cl-marklogic}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_drakma} ${lisp_fiveam} ${lisp_local-time}";
      name = "lisp_cl-marklogic-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
