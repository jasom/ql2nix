
{ buildLispPackage, stdenv, fetchurl, lisp-project_smart-buffer, 
   lisp_flexi-streams, lisp_xsubseq,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_xsubseq  ];
      inherit stdenv;
      systemName = "smart-buffer";
      
      sourceProject = "${lisp-project_smart-buffer}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_xsubseq}";
      name = "lisp_smart-buffer-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
