
{ buildLispPackage, stdenv, fetchurl, lisp-project_cerberus, 
   lisp_glass, lisp_usocket, lisp_ironclad, lisp_babel, lisp_flexi-streams, lisp_nibbles, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_glass lisp_usocket lisp_ironclad lisp_babel lisp_flexi-streams lisp_nibbles lisp_alexandria  ];
      inherit stdenv;
      systemName = "cerberus";
      
      sourceProject = "${lisp-project_cerberus}";
      patches = [];
      lisp_dependencies = "${lisp_glass} ${lisp_usocket} ${lisp_ironclad} ${lisp_babel} ${lisp_flexi-streams} ${lisp_nibbles} ${lisp_alexandria}";
      name = "lisp_cerberus-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
