
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-stomp, 
   lisp_babel, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-stomp";
      
      sourceProject = "${lisp-project_cl-stomp}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_usocket}";
      name = "lisp_cl-stomp-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
