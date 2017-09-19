
{ buildLispPackage, stdenv, fetchurl, lisp-project_sexml, 
   lisp_macroexpand-dammit, lisp_contextl, lisp_cxml, lisp_alexandria, lisp_cl-ppcre,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_macroexpand-dammit lisp_contextl lisp_cxml lisp_alexandria lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "sexml-objects";
      
      sourceProject = "${lisp-project_sexml}";
      patches = [];
      lisp_dependencies = "${lisp_macroexpand-dammit} ${lisp_contextl} ${lisp_cxml} ${lisp_alexandria} ${lisp_cl-ppcre}";
      name = "lisp_sexml-objects-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
