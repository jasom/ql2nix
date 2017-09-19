
{ buildLispPackage, stdenv, fetchurl, lisp-project_qmynd, 
   lisp_usocket, lisp_list-of, lisp_ironclad, lisp_flexi-streams, lisp_babel,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_list-of lisp_ironclad lisp_flexi-streams lisp_babel  ];
      inherit stdenv;
      systemName = "qmynd";
      
      sourceProject = "${lisp-project_qmynd}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_list-of} ${lisp_ironclad} ${lisp_flexi-streams} ${lisp_babel}";
      name = "lisp_qmynd-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
