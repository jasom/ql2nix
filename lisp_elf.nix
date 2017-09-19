
{ buildLispPackage, stdenv, fetchurl, lisp-project_elf, 
   lisp_flexi-streams, lisp_cl-ppcre, lisp_trivial-shell, lisp_split-sequence, lisp_metabang-bind, lisp_com-gigamonkeys-binary-data, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_cl-ppcre lisp_trivial-shell lisp_split-sequence lisp_metabang-bind lisp_com-gigamonkeys-binary-data lisp_alexandria  ];
      inherit stdenv;
      systemName = "elf";
      
      sourceProject = "${lisp-project_elf}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_cl-ppcre} ${lisp_trivial-shell} ${lisp_split-sequence} ${lisp_metabang-bind} ${lisp_com-gigamonkeys-binary-data} ${lisp_alexandria}";
      name = "lisp_elf-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
