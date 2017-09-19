
{ buildLispPackage, stdenv, fetchurl, lisp-project_beirc, 
   lisp_cl-fad, lisp_cl-ppcre, lisp_cl-irc, lisp_mcclim,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_cl-ppcre lisp_cl-irc lisp_mcclim  ];
      inherit stdenv;
      systemName = "beirc";
      
      sourceProject = "${lisp-project_beirc}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_cl-irc} ${lisp_mcclim}";
      name = "lisp_beirc-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
