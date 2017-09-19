
{ buildLispPackage, stdenv, fetchurl, lisp-project_frpc, 
   lisp_glass, lisp_pounds, lisp_bordeaux-threads, lisp_usocket, lisp_flexi-streams, lisp_nibbles, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_glass lisp_pounds lisp_bordeaux-threads lisp_usocket lisp_flexi-streams lisp_nibbles lisp_alexandria  ];
      inherit stdenv;
      systemName = "frpc";
      
      sourceProject = "${lisp-project_frpc}";
      patches = [];
      lisp_dependencies = "${lisp_glass} ${lisp_pounds} ${lisp_bordeaux-threads} ${lisp_usocket} ${lisp_flexi-streams} ${lisp_nibbles} ${lisp_alexandria}";
      name = "lisp_frpc-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
