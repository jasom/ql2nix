
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-virtualbox, 
   lisp_alexandria, lisp_cl-ppcre, lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-virtualbox";
      
      sourceProject = "${lisp-project_cl-virtualbox}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_usocket}";
      name = "lisp_cl-virtualbox-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
