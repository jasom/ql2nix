
{ buildLispPackage, stdenv, fetchurl, lisp-project_3b-swf, 
   lisp_cxml, lisp_vecto, lisp_cl-jpeg, lisp_salza2, lisp_chipz, lisp_alexandria, lisp_flexi-streams, lisp_ieee-floats,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cxml lisp_vecto lisp_cl-jpeg lisp_salza2 lisp_chipz lisp_alexandria lisp_flexi-streams lisp_ieee-floats  ];
      inherit stdenv;
      systemName = "3b-swf";
      
      sourceProject = "${lisp-project_3b-swf}";
      patches = [];
      lisp_dependencies = "${lisp_cxml} ${lisp_vecto} ${lisp_cl-jpeg} ${lisp_salza2} ${lisp_chipz} ${lisp_alexandria} ${lisp_flexi-streams} ${lisp_ieee-floats}";
      name = "lisp_3b-swf-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
