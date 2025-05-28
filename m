Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uKEMe-00034R-PW
	for mharc-qemu-rust@gnu.org; Wed, 28 May 2025 06:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uKEMc-0002xH-MQ
 for qemu-rust@nongnu.org; Wed, 28 May 2025 06:50:26 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uKEMY-0006vE-GB
 for qemu-rust@nongnu.org; Wed, 28 May 2025 06:50:26 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6046ecc3e43so5353503a12.3
 for <qemu-rust@nongnu.org>; Wed, 28 May 2025 03:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748429419; x=1749034219; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIQ6TBpW2Mybpcelh0KGyJ/cob5bnIl3jOBnBPqRWhs=;
 b=UPxF8CYKyZfBgO/cYEw66HAG5k17nA9ej9S84xc2RnMjxiZOcqcYRjuGkaQzLZJxti
 C6fgZp1jdd/6iTpUEKOoFq8dYB+1iFUmtebdLHmA4/aQaQJCydrhfBnWinf8Ob0A5Q36
 C7easBybl2Aeg4Ntk3JqaYKv/VYhBkdI3o9IZfJAkwbXI20DMYsYRmhCcjWRnzb/GQmR
 pzdVVf70ZnoWW3ejm3eXJSDkF5mHwX4mvLi6eduOwuuiMH6A5nXgymgUhkEmifJuJBNx
 uNK7Jg5PaVW1tWWdAJnkGgyIXTsmmhEdfKGTv4BAjIJM8BccOOpm8/3BQarV5PXNg3DW
 lESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748429419; x=1749034219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mIQ6TBpW2Mybpcelh0KGyJ/cob5bnIl3jOBnBPqRWhs=;
 b=tzyZeS0BVeuqzLdkilSHsHMY7xviuuClc2IokWoj575gOt1/5Erf1K4hysgYericEh
 sNB8keIPixgYz5p9HLyO6jkA5iDzBF2T0zH+OBFWEq3XAp2ABdf5fJ/3D2WPOUeOGKgh
 ijTlYaDwHYRz79x11RcXRW/uaYHnvfr54mX5p6sEPdNdhYwDYFENqS5AlsPbw+oGXcMZ
 vtS1rqOfyN4FrjHxI2fPY+cMGkxRmVRw6/qyAxiBabmOhkw4vQHMW2weWdTIvQziFpw7
 3U7AEhQSIjIVGb8uZdHFacw5IEiYd7YkbkzCm/vJvctdczvbsuAq130BWMtI0WSGpf9j
 Lbrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEgH0qAPF1HtBXQ/ikIugGQQMEtiJtWoQAqj4A9fpeGMWDymPK4wohvdCoMAYOL7CLEzT1lCqOw/A=@nongnu.org
X-Gm-Message-State: AOJu0Yz5898/PaLWCMLQ41XzmAZRfaZlSuUfdB+2XM3GbQexkGIUdFX1
 ndmC2Suw0h0oHEmdfGd5Yyh7COs7xvGCmtuzN4L+G9iIlQvlKu9Yw0Iqnkelq3FNaY7IudJ3gPR
 gzf1PefIefjNOvFmuAvcALyJ7W6HHjFg7nTyVCyEUXA==
X-Gm-Gg: ASbGncv0LVgzE7DGEb5XU9fT3pBX3fv3ZU9xvEJQpw4qpvgLRPOB//lLO2IRgScxQsp
 at+PxVkXX36SoLVceeqpgJWnZzLM4m+9JoOIcYXVDj4pNEhnjin3DliUA8qT4yJ1bEC5bm6/Lor
 1+e6xvs1FCqo1VrMqfnppro9uNKBoa
X-Google-Smtp-Source: AGHT+IFDw4Ju7EGVUyeg36asPxjGdegtiKj6AuvFzPWoAP2po1c86+vtar85uI99wMCpaNNWjV6lxt3lA2foKDo4Cmc=
X-Received: by 2002:a05:6402:35d3:b0:5f8:afab:9e14 with SMTP id
 4fb4d7f45d1cf-6051c5076bamr1339111a12.28.1748429419002; Wed, 28 May 2025
 03:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-rust-qdev-properties-v1-1-5b18b218bad1@linaro.org>
 <CABgObfbVSZ9MNzjXBu1mr8bzX9F-AoKVRQzCJj6c+SUpsoUQNw@mail.gmail.com>
In-Reply-To: <CABgObfbVSZ9MNzjXBu1mr8bzX9F-AoKVRQzCJj6c+SUpsoUQNw@mail.gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 28 May 2025 13:49:52 +0300
X-Gm-Features: AX0GCFsGUOQtCUjnuZtHIfF-nd5_WexCBtOJqCWNIobN4XRF_MGaccUxl2brApQ
Message-ID: <CAAjaMXbEB_c7NpBVen29Tgtmki4+nADnXysawK+oSbWDBWPR2w@mail.gmail.com>
Subject: Re: [PATCH WIP RFC] rust: add qdev DeviceProperties derive macro
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 28 May 2025 10:50:27 -0000

On Fri, May 23, 2025 at 4:06=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
>
>
> Il gio 22 mag 2025, 10:12 Manos Pitsidianakis <manos.pitsidianakis@linaro=
.org> ha scritto:
>>
>> This is unnecessary though, because once we have the
>> const_refs_to_static feature we can introduce a QdevProp trait that
>> returns a reference to a type's qdev_prop_* global variable. We cannot
>> do this now because for our minimum Rust version we cannot refer to
>> statics from const values.
>
>
> Why don't you already write it assuming const_refs_to_static? If needed w=
e can add a hack to make the VALUE an enum, similar to what is already in v=
mstate.rs.
>
>> So, this patch is not for merging yet, I will wait until we upgrade the
>> Rust version and re-spin it with a proper trait-based implementation (an=
d
>> also split it into individual steps/patches).
>
>
> It's not too large, overall.
>
>>  #[repr(C)]
>> -#[derive(qemu_api_macros::Object)]
>> +#[derive(qemu_api_macros::Object, qemu_api_macros::DeviceProperties)]
>
>
> Is there more to be derived that is useful for Devices? Maybe the macro c=
an be DeviceState or Device.

VMStateDescription and the realize callback, I think.

>
>>  +    #[property(name =3D c"chardev", qdev_prop =3D qemu_api::bindings::=
qdev_prop_chr)]
>
>
> Can you change the name to be a "normal" string and change it to a C lite=
ral in the macro?

That'd be neat, it should be possible to create a cstr literal token
and error out if the input str literal cannot be represented as a
cstr.

>
>> diff --git a/rust/hw/char/pl011/src/device_class.rs b/rust/hw/char/pl011=
/src/device_class.rs
>> index d328d846323f6080a9573053767e51481eb32941..83d70d7d82aac4a3252a0b4c=
b24af705b01d3635 100644
>> --- a/rust/hw/char/pl011/src/device_class.rs
>> +++ b/rust/hw/char/pl011/src/device_class.rs
>> @@ -8,11 +8,8 @@
>>  };
>>
>>  use qemu_api::{
>> -    bindings::{qdev_prop_bool, qdev_prop_chr},
>> -    prelude::*,
>> -    vmstate::VMStateDescription,
>> -    vmstate_clock, vmstate_fields, vmstate_of, vmstate_struct, vmstate_=
subsections, vmstate_unused,
>> -    zeroable::Zeroable,
>> +    prelude::*, vmstate::VMStateDescription, vmstate_clock, vmstate_fie=
lds, vmstate_of,
>> +    vmstate_struct, vmstate_subsections, vmstate_unused, zeroable::Zero=
able,
>>  };
>
>
> I would also merge the files at this point, but no hurry.
>
>> +#[derive(Debug)]
>> +struct DeviceProperty {
>> +    name: Option<syn::LitCStr>,
>> +    qdev_prop: Option<syn::Path>,
>> +    assert_type: Option<proc_macro2::TokenStream>,
>> +    bitnr: Option<syn::Expr>,
>> +    defval: Option<syn::Expr>,
>> +}
>> +
>> +impl Parse for DeviceProperty {
>
>
> Can you look into using https://docs.rs/crate/attrs/latest for parsing?
>
> (attrs doesn't support LitCStr btw)

I think we can do without it for now, even if this patch is not
cleaned up (for example it has unwraps instead of proper panic
messages or error handling) it does not end up very complex as far as
attribute parsing is concerned.

I'm fine with either approach though.

>
>> +#[proc_macro_derive(DeviceProperties, attributes(property, bool_propert=
y))]
>> +pub fn derive_device_properties(input: TokenStream) -> TokenStream {
>
>
> Do you need to handle errors in the parsing of attributes?...
>
>> +        _other =3D> unreachable!(),
>

This should be literally unreachable IIUC, because only property names
declared in the attributes part of `#[proc_macro_derive(...
attributes(__))]` would get accepted by the compiler and passed to the
derive macro.

>
> ... Yes, you do=E2=80=94there is code already in qemu_macros, used by der=
ive_object_or_error(), to get the fields of a struct with proper error hand=
ling.
>
>> let prop_name =3D prop.name.as_ref().unwrap();
>>
>> + let field_name =3D field.ident.as_ref().unwrap();
>>
>> + let qdev_prop =3D prop.qdev_prop.as_ref().unwrap();
>>
>> + let bitnr =3D prop.bitnr.as_ref().unwrap_or(&zero);
>>
>> + let set_default =3D prop.defval.is_some();
>>
>> + let defval =3D prop.defval.as_ref().unwrap_or(&zero);+                =
bitnr: #bitnr,
>> +
>
>
> You also need to use let...else here instead of unwrap(), since panicking=
 provides worse error messages.
>
>>               set_default: #set_default,
>> +                defval: ::qemu_api::bindings::Property__bindgen_ty_1 { =
u: #defval as u64 },
>
>
> If you like it, you can write this also as
>
>   #(bitnr: #bitnr,)?
>   #(set_default: true, defval: ...)?
>
> and keep bitnr and defval as Options, since the None case is handled by t=
he default below.
>
> Paolo

Thanks I will take another look!

>
>
>> +                ..::qemu_api::zeroable::Zeroable::ZERO
>> +            }
>> +        });
>> +    }
>> +    let properties_expanded =3D quote_spanned! {span.into()=3D>
>> +        #(#assertions)*
>> +
>> +        impl ::qemu_api::qdev::DevicePropertiesImpl for #name {
>> +            fn properties() -> &'static [::qemu_api::bindings::Property=
] {
>> +                static PROPERTIES: &'static [::qemu_api::bindings::Prop=
erty] =3D &[#(#properties_expanded),*];
>> +
>> +                PROPERTIES
>> +            }
>> +        }
>> +    };
>> +
>> +    TokenStream::from(properties_expanded)
>> +}
>> +
>>  #[proc_macro_derive(Wrapper)]
>>  pub fn derive_opaque(input: TokenStream) -> TokenStream {
>>      let input =3D parse_macro_input!(input as DeriveInput);
>> diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
>> index 1279d7a58d50e1bf6c8d2e6f00d7229bbb19e003..2fd8b2750ffabcaa1065558d=
38a700e35fbc9136 100644
>> --- a/rust/qemu-api/src/qdev.rs
>> +++ b/rust/qemu-api/src/qdev.rs
>> @@ -100,8 +100,19 @@ pub trait ResettablePhasesImpl {
>>      T::EXIT.unwrap()(unsafe { state.as_ref() }, typ);
>>  }
>>
>> +pub trait DevicePropertiesImpl {
>> +    /// An array providing the properties that the user can set on the
>> +    /// device.  Not a `const` because referencing statics in constants
>> +    /// is unstable until Rust 1.83.0.
>> +    fn properties() -> &'static [Property] {
>> +        &[]
>> +    }
>> +}
>> +
>>  /// Trait providing the contents of [`DeviceClass`].
>> -pub trait DeviceImpl: ObjectImpl + ResettablePhasesImpl + IsA<DeviceSta=
te> {
>> +pub trait DeviceImpl:
>> +    ObjectImpl + ResettablePhasesImpl + DevicePropertiesImpl + IsA<Devi=
ceState>
>> +{
>>      /// _Realization_ is the second stage of device creation. It contai=
ns
>>      /// all operations that depend on device properties and can fail (n=
ote:
>>      /// this is not yet supported for Rust devices).
>> @@ -110,13 +121,6 @@ pub trait DeviceImpl: ObjectImpl + ResettablePhases=
Impl + IsA<DeviceState> {
>>      /// with the function pointed to by `REALIZE`.
>>      const REALIZE: Option<fn(&Self)> =3D None;
>>
>> -    /// An array providing the properties that the user can set on the
>> -    /// device.  Not a `const` because referencing statics in constants
>> -    /// is unstable until Rust 1.83.0.
>> -    fn properties() -> &'static [Property] {
>> -        &[]
>> -    }
>> -
>>      /// A `VMStateDescription` providing the migration format for the d=
evice
>>      /// Not a `const` because referencing statics in constants is unsta=
ble
>>      /// until Rust 1.83.0.
>> @@ -171,7 +175,7 @@ pub fn class_init<T: DeviceImpl>(&mut self) {
>>          if let Some(vmsd) =3D <T as DeviceImpl>::vmsd() {
>>              self.vmsd =3D vmsd;
>>          }
>> -        let prop =3D <T as DeviceImpl>::properties();
>> +        let prop =3D <T as DevicePropertiesImpl>::properties();
>>          if !prop.is_empty() {
>>              unsafe {
>>                  bindings::device_class_set_props_n(self, prop.as_ptr(),=
 prop.len());
>> diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
>> index a658a49fcfdda8fa4b9d139c10afb6ff3243790b..e8eadfd6e9add385ffc97de0=
15b84aae825c18ee 100644
>> --- a/rust/qemu-api/tests/tests.rs
>> +++ b/rust/qemu-api/tests/tests.rs
>> @@ -9,7 +9,7 @@
>>      cell::{self, BqlCell},
>>      declare_properties, define_property,
>>      prelude::*,
>> -    qdev::{DeviceImpl, DeviceState, Property, ResettablePhasesImpl},
>> +    qdev::{DeviceImpl, DevicePropertiesImpl, DeviceState, Property, Res=
ettablePhasesImpl},
>>      qom::{ObjectImpl, ParentField},
>>      sysbus::SysBusDevice,
>>      vmstate::VMStateDescription,
>> @@ -68,10 +68,13 @@ impl ObjectImpl for DummyState {
>>
>>  impl ResettablePhasesImpl for DummyState {}
>>
>> -impl DeviceImpl for DummyState {
>> +impl DevicePropertiesImpl for DummyState {
>>      fn properties() -> &'static [Property] {
>>          &DUMMY_PROPERTIES
>>      }
>> +}
>> +
>> +impl DeviceImpl for DummyState {
>>      fn vmsd() -> Option<&'static VMStateDescription> {
>>          Some(&VMSTATE)
>>      }
>> @@ -85,6 +88,8 @@ pub struct DummyChildState {
>>
>>  qom_isa!(DummyChildState: Object, DeviceState, DummyState);
>>
>> +impl DevicePropertiesImpl for DummyChildState {}
>> +
>>  pub struct DummyChildClass {
>>      parent_class: <DummyState as ObjectType>::Class,
>>  }
>>
>> ---
>> base-commit: 2af4a82ab2cce3412ffc92cd4c96bd870e33bc8e
>> change-id: 20250522-rust-qdev-properties-728e8f6a468e
>>
>> --
>> =CE=B3=CE=B1=E1=BF=96=CE=B1 =CF=80=CF=85=CF=81=CE=AF =CE=BC=CE=B9=CF=87=
=CE=B8=CE=AE=CF=84=CF=89
>>

