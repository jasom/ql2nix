
{ buildLispPackage, stdenv, fetchurl, lisp-project_frpc, 
   lisp_alexandria, lisp_babel, lisp_bordeaux-threads, lisp_flexi-streams, lisp_glass, lisp_nibbles, lisp_pounds, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_babel lisp_bordeaux-threads lisp_flexi-streams lisp_glass lisp_nibbles lisp_pounds lisp_usocket  ];
      inherit stdenv;
      systemName = "frpc";
      
      sourceProject = "${lisp-project_frpc}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_babel} ${lisp_bordeaux-threads} ${lisp_flexi-streams} ${lisp_glass} ${lisp_nibbles} ${lisp_pounds} ${lisp_usocket}";
      name = "lisp_frpc-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
