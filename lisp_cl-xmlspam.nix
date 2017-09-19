
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-xmlspam, 
   lisp_cl-ppcre, lisp_cxml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_cxml  ];
      inherit stdenv;
      systemName = "cl-xmlspam";
      
      sourceProject = "${lisp-project_cl-xmlspam}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_cxml}";
      name = "lisp_cl-xmlspam-20101006-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
