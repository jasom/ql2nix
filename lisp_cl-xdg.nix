
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-xdg, 
   lisp_cl-xmlspam, lisp_cl-sxml, lisp_flexi-streams, lisp_parse-number, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-xmlspam lisp_cl-sxml lisp_flexi-streams lisp_parse-number lisp_split-sequence  ];
      inherit stdenv;
      systemName = "cl-xdg";
      
      sourceProject = "${lisp-project_cl-xdg}";
      patches = [];
      lisp_dependencies = "${lisp_cl-xmlspam} ${lisp_cl-sxml} ${lisp_flexi-streams} ${lisp_parse-number} ${lisp_split-sequence}";
      name = "lisp_cl-xdg-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
