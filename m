Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHjts-0007hp-GG
	for mharc-qemu-rust@gnu.org; Wed, 21 May 2025 09:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHjtq-0007hI-K0
 for qemu-rust@nongnu.org; Wed, 21 May 2025 09:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHjtn-0006oB-9D
 for qemu-rust@nongnu.org; Wed, 21 May 2025 09:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747835661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ahvu8LroNRFcPM+ZFW+N/NaWUi0JxT/noTGbCdkPo3Y=;
 b=QJLVLsRYaaNlWrznT5EHWVwJfJuFhsZUedOI212wUAOrfm41TDl3cIUpry1yNxy0NKIabx
 rnPMRCAIs6+3F3PpYE0xlmBUAie+iSYAe8miKSfRjdVUqT47W8bymb6hlR/TbGIc7rtE15
 bx9I031xy3XsEMRXczTCP3OSyhn8YUw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-3ZI3gzTWNHG29hKvl4qKKA-1; Wed, 21 May 2025 09:54:20 -0400
X-MC-Unique: 3ZI3gzTWNHG29hKvl4qKKA-1
X-Mimecast-MFC-AGG-ID: 3ZI3gzTWNHG29hKvl4qKKA_1747835659
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a3561206b3so2306708f8f.2
 for <qemu-rust@nongnu.org>; Wed, 21 May 2025 06:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747835659; x=1748440459;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ahvu8LroNRFcPM+ZFW+N/NaWUi0JxT/noTGbCdkPo3Y=;
 b=iM/T6JvmEV6YYKnxcjmk0PdMAOIUyfZ+o65nQ6GC8jgPf6hjXH4ePFMCto7VnldRv2
 RHGFR9iGdQ5m4HTcbH1S1HVYIMNgYg+FAqYc2j7enLEllfcGn9P0btLOnJ0/Wcv4n1do
 vZRa+zXmlYB4QdHDJI6vvIGbR708KBWc8FbW0WvGgn4DRbXG9W1mgGLqs0oOHo6U2k7w
 MuxbGECYsSi74rLHqRMh2KBXXcdg9wjY5yhdFZuQVjgYXBU2JyD5tQFMkrTD+GFjT/iN
 pGYbHyMjMkw1XRH7ZY9KN5XW6kzQ7+8nPdeKzgT5EFLBGXZzWjc7hHZvuYWzGbPzclaO
 JTDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjlI1SYMz6f92r6TlV32xtFfRNp+9N47479wAZKCa/VQXnzcN1TIr4je9uRLqzAiLdRhbW6wvT8OI=@nongnu.org
X-Gm-Message-State: AOJu0YztEBdWXsjwJyHeT3eo8lQm/hIj8EnelL6oiBSpfZ+m74roWbuB
 T8ouLxhUW1W4tF6akPEhNTh6xP3MpHgZehyqRcNixHdNF1oFTW/g8Pkh3uZcIC6bU0j/8rGt1t4
 WiJGwxbwZOPPYUtgy3h9RLd7a3h7fTUyTUGYMNzsjQo0EY4RBB8Oqnm9xue3Di6MwBO1TekSF4Q
 1rER9Bg6bdHlV99HDAZob7o73IFiuhpQ==
X-Gm-Gg: ASbGncuCY2T2NPYqynWiNSbty/LeG7f1yoYnVRk12bVVX7H7O/tXOsdRSCSO8nDDNf1
 uO+3wtO6iEcrhx2N/PF5NgodK6LiMD2AA7h9Qtpel6zTMWrLOxsD80t8q2ZOQiewocvw=
X-Received: by 2002:a05:6000:230a:b0:3a0:9dc2:5e0e with SMTP id
 ffacd0b85a97d-3a35c835093mr21434984f8f.11.1747835658821; 
 Wed, 21 May 2025 06:54:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdJZlzDwm4TBBlBTlL+PuCb9K7viFeQI3aRtoOij40Bfd65rhUItnMWKjcuhbdBv/qnGzVpN3QHnPJNYyi1Mk=
X-Received: by 2002:a05:6000:230a:b0:3a0:9dc2:5e0e with SMTP id
 ffacd0b85a97d-3a35c835093mr21434948f8f.11.1747835658377; Wed, 21 May 2025
 06:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250521081845.496442-1-pbonzini@redhat.com>
 <20250521081845.496442-6-pbonzini@redhat.com>
 <871psi9tsw.fsf@draig.linaro.org>
 <CAAjaMXbVCfXBqmNYH3Up1n+N9VCgRamg9msURwE-x1KxcKOi4Q@mail.gmail.com>
In-Reply-To: <CAAjaMXbVCfXBqmNYH3Up1n+N9VCgRamg9msURwE-x1KxcKOi4Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 May 2025 15:54:05 +0200
X-Gm-Features: AX0GCFvuR3tV4qnlJj1pWJbtrv19snL13pVhbxNoE8DBKtKqNrnDt4iJfVBaAc8
Message-ID: <CABgObfboVMocRWRHJtLZoQafcwbVF=RO5G4kZmn2oNu1ZkuBoA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/6] rust: pl011: switch from bilge to bitfield-struct
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, "Maydell, Peter" <peter.maydell@linaro.org>,
 qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hCOmlvQ6kJ0j_horIP5Apst4U8AyXh7cC28Y1_L3t-A_1747835659
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008b313b0635a5b3b2"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.184,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 21 May 2025 13:54:27 -0000

--0000000000008b313b0635a5b3b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mer 21 mag 2025, 13:12 Manos Pitsidianakis <
manos.pitsidianakis@linaro.org> ha scritto:

> On Wed, May 21, 2025 at 12:50=E2=80=AFPM Alex
> > > -    _reserved_unpredictable: u4,
> > > +    #[bits(4)]
> > > +    _reserved_unpredictable: u8,
> >
> > This does come off as a little janky - effectively casting the u8 to
> > only cover 4 bits. Is this not something we can derive from the type? I
> > see lower down...
>
> Also, I wonder, does bitfield_struct also use 1 bit to represent bool?
>

Yes.

Also, to answer Alex, note that u4 is not a standard Rust type, it comes
from the arbitrary-int crate.

Paolo

>
> >
> > > +}
> > > +
> > > +impl Errors {
> > > +    pub const BREAK: Self =3D Errors::new().with_break_error(true);
> > >  }
> > >
> > >  /// Data Register, `UARTDR`
> > > @@ -93,19 +101,18 @@ pub struct Errors {
> > >  /// The `UARTDR` register is the data register; write for TX and
> > >  /// read for RX. It is a 12-bit register, where bits 7..0 are the
> > >  /// character and bits 11..8 are error bits.
> > > -#[bitsize(32)]
> > > -#[derive(Clone, Copy, Default, DebugBits, FromBits)]
> > > +#[bitfield(u32)]
> > >  #[doc(alias =3D "UARTDR")]
> > >  pub struct Data {
> > >      pub data: u8,
> > > +    #[bits(8)]
> > >      pub errors: Errors,
> >
> > We should be able to derive that Errors fits into 8 bits as defined
> above.
> >
> > >      _reserved: u16,
> > >  }
> > > -impl_vmstate_bitsized!(Data);
> > > +impl_vmstate_forward!(Data);
> > >
> > >  impl Data {
> > > -    // bilge is not very const-friendly, unfortunately
> > > -    pub const BREAK: Self =3D Self { value: 1 << 10 };
> > > +    pub const BREAK: Self =3D Self::new().with_errors(Errors::BREAK)=
;
> > >  }
> >
> > I guess this flys a little over my head, is the effect only seen in the
> > generated code?
>
> Because these functions are const, they can be evaluated at compile
> time, so this would be replaced with a constant value when compiled.
>
> >
> > >
> > >  /// Receive Status Register / Error Clear Register, `UARTRSR/UARTECR=
`
> > > @@ -119,13 +126,14 @@ impl Data {
> > >  /// and UARTECR for writes, but really it's a single error status
> > >  /// register where writing anything to the register clears the error
> > >  /// bits.
> > > -#[bitsize(32)]
> > > -#[derive(Clone, Copy, DebugBits, FromBits)]
> > > +#[bitfield(u32)]
> > >  pub struct ReceiveStatusErrorClear {
> > > +    #[bits(8)]
> > >      pub errors: Errors,
> > > -    _reserved_unpredictable: u24,
> > > +    #[bits(24)]
> > > +    _reserved_unpredictable: u32,
> > >  }
> > > -impl_vmstate_bitsized!(ReceiveStatusErrorClear);
> > > +impl_vmstate_forward!(ReceiveStatusErrorClear);
> > >
> > >  impl ReceiveStatusErrorClear {
> > >      pub fn set_from_data(&mut self, data: Data) {
> > > @@ -138,14 +146,7 @@ pub fn reset(&mut self) {
> > >      }
> > >  }
> > >
> > > -impl Default for ReceiveStatusErrorClear {
> > > -    fn default() -> Self {
> > > -        0.into()
> > > -    }
> > > -}
> > > -
> > > -#[bitsize(32)]
> > > -#[derive(Clone, Copy, DebugBits, FromBits)]
> > > +#[bitfield(u32, default =3D false)]
> > >  /// Flag Register, `UARTFR`
> > >  ///
> > >  /// This has the usual inbound RS232 modem-control signals, plus fla=
gs
> > > @@ -171,9 +172,10 @@ pub struct Flags {
> > >      pub transmit_fifo_empty: bool,
> > >      /// RI: Ring indicator
> > >      pub ring_indicator: bool,
> > > -    _reserved_zero_no_modify: u23,
> > > +    #[bits(23)]
> > > +    _reserved_zero_no_modify: u32,
> > >  }
> > > -impl_vmstate_bitsized!(Flags);
> > > +impl_vmstate_forward!(Flags);
> > >
> > >  impl Flags {
> > >      pub fn reset(&mut self) {
> > > @@ -183,16 +185,14 @@ pub fn reset(&mut self) {
> > >
> > >  impl Default for Flags {
> > >      fn default() -> Self {
> > > -        let mut ret: Self =3D 0.into();
> > >          // After reset TXFF, RXFF, and BUSY are 0, and TXFE and RXFE
> are 1
> > > -        ret.set_receive_fifo_empty(true);
> > > -        ret.set_transmit_fifo_empty(true);
> > > -        ret
> > > +        Self::from(0)
> > > +            .with_receive_fifo_empty(true)
> > > +            .with_transmit_fifo_empty(true)
> >
> > I guess skipping the mut is the advantage of being able to const eval.
>
> No you can actually have mut in const-eval. What you can't have is
> heap allocations and calling non-const functions, and some other
> things. But in this case it doesn't matter, because this is the
> Default trait and it's not const, because it's a trait method.
>
> >
> > >      }
> > >  }
> > >
> > > -#[bitsize(32)]
> > > -#[derive(Clone, Copy, DebugBits, FromBits)]
> > > +#[bitfield(u32)]
> > >  /// Line Control Register, `UARTLCR_H`
> > >  #[doc(alias =3D "UARTLCR_H")]
> > >  pub struct LineControl {
> > > @@ -201,48 +201,46 @@ pub struct LineControl {
> > >      /// PEN: Parity enable
> > >      pub parity_enabled: bool,
> > >      /// EPS: Even parity select
> > > +    #[bits(1)]
> > >      pub parity: Parity,
> > >      /// STP2: Two stop bits select
> > >      pub two_stops_bits: bool,
> > >      /// FEN: Enable FIFOs
> > > +    #[bits(1)]
> > >      pub fifos_enabled: Mode,
> > >      /// WLEN: Word length in bits
> > >      /// b11 =3D 8 bits
> > >      /// b10 =3D 7 bits
> > >      /// b01 =3D 6 bits
> > >      /// b00 =3D 5 bits.
> > > +    #[bits(2)]
> > >      pub word_length: WordLength,
> > >      /// SPS Stick parity select
> > >      pub sticky_parity: bool,
> > >      /// 31:8 - Reserved, do not modify, read as zero.
> > > -    _reserved_zero_no_modify: u24,
> > > +    #[bits(24)]
> > > +    _reserved_zero_no_modify: u32,
> > >  }
> > > -impl_vmstate_bitsized!(LineControl);
> > > +impl_vmstate_forward!(LineControl);
> > >
> > >  impl LineControl {
> > >      pub fn reset(&mut self) {
> > >          // All the bits are cleared to 0 when reset.
> > > -        *self =3D 0.into();
> > > +        *self =3D Self::default();
> > >      }
> > >  }
> > >
> > > -impl Default for LineControl {
> > > -    fn default() -> Self {
> > > -        0.into()
> > > -    }
> > > -}
> > > -
> > > -#[bitsize(1)]
> > > -#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
> > >  /// `EPS` "Even parity select", field of [Line Control
> > >  /// register](LineControl).
> > > +#[repr(u8)]
> > > +#[derive(Clone, Copy, Debug, Eq, PartialEq, qemu_api_macros::TryInto=
)]
> > >  pub enum Parity {
> > >      Odd =3D 0,
> > >      Even =3D 1,
> > >  }
> > >
> > > -#[bitsize(1)]
> > > -#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
> > > +#[repr(u8)]
> > > +#[derive(Clone, Copy, Debug, Eq, PartialEq, qemu_api_macros::TryInto=
)]
> > >  /// `FEN` "Enable FIFOs" or Device mode, field of [Line Control
> > >  /// register](LineControl).
> > >  pub enum Mode {
> > > @@ -253,8 +251,8 @@ pub enum Mode {
> > >      FIFO =3D 1,
> > >  }
> > >
> > > -#[bitsize(2)]
> > > -#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
> > > +#[repr(u8)]
> > > +#[derive(Clone, Copy, Debug, Eq, PartialEq, qemu_api_macros::TryInto=
)]
> > >  /// `WLEN` Word length, field of [Line Control register](LineControl=
).
> > >  ///
> > >  /// These bits indicate the number of data bits transmitted or
> received in a
> > > @@ -275,9 +273,8 @@ pub enum WordLength {
> > >  /// The `UARTCR` register is the control register. It contains vario=
us
> > >  /// enable bits, and the bits to write to set the usual outbound RS2=
32
> > >  /// modem control signals. All bits reset to 0 except TXE and RXE.
> > > -#[bitsize(32)]
> > > +#[bitfield(u32, default =3D false)]
> > >  #[doc(alias =3D "UARTCR")]
> > > -#[derive(Clone, Copy, DebugBits, FromBits)]
> > >  pub struct Control {
> > >      /// `UARTEN` UART enable: 0 =3D UART is disabled.
> > >      pub enable_uart: bool,
> > > @@ -285,9 +282,10 @@ pub struct Control {
> > >      /// QEMU does not model this.
> > >      pub enable_sir: bool,
> > >      /// `SIRLP` SIR low-power IrDA mode. QEMU does not model this.
> > > -    pub sir_lowpower_irda_mode: u1,
> > > +    pub sir_lowpower_irda_mode: bool,
> > >      /// Reserved, do not modify, read as zero.
> > > -    _reserved_zero_no_modify: u4,
> > > +    #[bits(4)]
> > > +    _reserved_zero_no_modify: u8,
> > >      /// `LBE` Loopback enable: feed UART output back to the input
> > >      pub enable_loopback: bool,
> > >      /// `TXE` Transmit enable
> > <snip>
> >
> > I guess I'm not seeing a massive difference here. I guess the const eva=
l
> > is nice but there is cognitive dissonance having annotations not match
> > types. It would be nice to have the best of both worlds.
> >
> > For now I don't see a compelling reason to change from a standard crate
> > (which I guess is the reason this is an RFC ;-)
> >
> > --
> > Alex Benn=C3=A9e
> > Virtualisation Tech Lead @ Linaro
>
> --
> Manos Pitsidianakis
> Emulation and Virtualization Engineer at Linaro Ltd
>
>

--0000000000008b313b0635a5b3b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 21 mag 2025, 13:12 Manos =
Pitsidianakis &lt;<a href=3D"mailto:manos.pitsidianakis@linaro.org">manos.p=
itsidianakis@linaro.org</a>&gt; ha scritto:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Wed, May 21, 2025 at 12:50=E2=80=AFPM Alex=
=C2=A0<br>
&gt; &gt; -=C2=A0 =C2=A0 _reserved_unpredictable: u4,<br>
&gt; &gt; +=C2=A0 =C2=A0 #[bits(4)]<br>
&gt; &gt; +=C2=A0 =C2=A0 _reserved_unpredictable: u8,<br>
&gt;<br>
&gt; This does come off as a little janky - effectively casting the u8 to<b=
r>
&gt; only cover 4 bits. Is this not something we can derive from the type? =
I<br>
&gt; see lower down...<br>
<br>
Also, I wonder, does bitfield_struct also use 1 bit to represent bool?<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Also, to answer Alex, no=
te that u4 is not a standard Rust type, it comes from the arbitrary-int cra=
te.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=
=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +impl Errors {<br>
&gt; &gt; +=C2=A0 =C2=A0 pub const BREAK: Self =3D Errors::new().with_break=
_error(true);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 /// Data Register, `UARTDR`<br>
&gt; &gt; @@ -93,19 +101,18 @@ pub struct Errors {<br>
&gt; &gt;=C2=A0 /// The `UARTDR` register is the data register; write for T=
X and<br>
&gt; &gt;=C2=A0 /// read for RX. It is a 12-bit register, where bits 7..0 a=
re the<br>
&gt; &gt;=C2=A0 /// character and bits 11..8 are error bits.<br>
&gt; &gt; -#[bitsize(32)]<br>
&gt; &gt; -#[derive(Clone, Copy, Default, DebugBits, FromBits)]<br>
&gt; &gt; +#[bitfield(u32)]<br>
&gt; &gt;=C2=A0 #[doc(alias =3D &quot;UARTDR&quot;)]<br>
&gt; &gt;=C2=A0 pub struct Data {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub data: u8,<br>
&gt; &gt; +=C2=A0 =C2=A0 #[bits(8)]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub errors: Errors,<br>
&gt;<br>
&gt; We should be able to derive that Errors fits into 8 bits as defined ab=
ove.<br>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 _reserved: u16,<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; -impl_vmstate_bitsized!(Data);<br>
&gt; &gt; +impl_vmstate_forward!(Data);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 impl Data {<br>
&gt; &gt; -=C2=A0 =C2=A0 // bilge is not very const-friendly, unfortunately=
<br>
&gt; &gt; -=C2=A0 =C2=A0 pub const BREAK: Self =3D Self { value: 1 &lt;&lt;=
 10 };<br>
&gt; &gt; +=C2=A0 =C2=A0 pub const BREAK: Self =3D Self::new().with_errors(=
Errors::BREAK);<br>
&gt; &gt;=C2=A0 }<br>
&gt;<br>
&gt; I guess this flys a little over my head, is the effect only seen in th=
e<br>
&gt; generated code?<br>
<br>
Because these functions are const, they can be evaluated at compile<br>
time, so this would be replaced with a constant value when compiled.<br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 /// Receive Status Register / Error Clear Register, `UARTRS=
R/UARTECR`<br>
&gt; &gt; @@ -119,13 +126,14 @@ impl Data {<br>
&gt; &gt;=C2=A0 /// and UARTECR for writes, but really it&#39;s a single er=
ror status<br>
&gt; &gt;=C2=A0 /// register where writing anything to the register clears =
the error<br>
&gt; &gt;=C2=A0 /// bits.<br>
&gt; &gt; -#[bitsize(32)]<br>
&gt; &gt; -#[derive(Clone, Copy, DebugBits, FromBits)]<br>
&gt; &gt; +#[bitfield(u32)]<br>
&gt; &gt;=C2=A0 pub struct ReceiveStatusErrorClear {<br>
&gt; &gt; +=C2=A0 =C2=A0 #[bits(8)]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub errors: Errors,<br>
&gt; &gt; -=C2=A0 =C2=A0 _reserved_unpredictable: u24,<br>
&gt; &gt; +=C2=A0 =C2=A0 #[bits(24)]<br>
&gt; &gt; +=C2=A0 =C2=A0 _reserved_unpredictable: u32,<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; -impl_vmstate_bitsized!(ReceiveStatusErrorClear);<br>
&gt; &gt; +impl_vmstate_forward!(ReceiveStatusErrorClear);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 impl ReceiveStatusErrorClear {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub fn set_from_data(&amp;mut self, data: Dat=
a) {<br>
&gt; &gt; @@ -138,14 +146,7 @@ pub fn reset(&amp;mut self) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; -impl Default for ReceiveStatusErrorClear {<br>
&gt; &gt; -=C2=A0 =C2=A0 fn default() -&gt; Self {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 0.into()<br>
&gt; &gt; -=C2=A0 =C2=A0 }<br>
&gt; &gt; -}<br>
&gt; &gt; -<br>
&gt; &gt; -#[bitsize(32)]<br>
&gt; &gt; -#[derive(Clone, Copy, DebugBits, FromBits)]<br>
&gt; &gt; +#[bitfield(u32, default =3D false)]<br>
&gt; &gt;=C2=A0 /// Flag Register, `UARTFR`<br>
&gt; &gt;=C2=A0 ///<br>
&gt; &gt;=C2=A0 /// This has the usual inbound RS232 modem-control signals,=
 plus flags<br>
&gt; &gt; @@ -171,9 +172,10 @@ pub struct Flags {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub transmit_fifo_empty: bool,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// RI: Ring indicator<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub ring_indicator: bool,<br>
&gt; &gt; -=C2=A0 =C2=A0 _reserved_zero_no_modify: u23,<br>
&gt; &gt; +=C2=A0 =C2=A0 #[bits(23)]<br>
&gt; &gt; +=C2=A0 =C2=A0 _reserved_zero_no_modify: u32,<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; -impl_vmstate_bitsized!(Flags);<br>
&gt; &gt; +impl_vmstate_forward!(Flags);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 impl Flags {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub fn reset(&amp;mut self) {<br>
&gt; &gt; @@ -183,16 +185,14 @@ pub fn reset(&amp;mut self) {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 impl Default for Flags {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 fn default() -&gt; Self {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut ret: Self =3D 0.into();<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // After reset TXFF, RXFF, and =
BUSY are 0, and TXFE and RXFE are 1<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.set_receive_fifo_empty(true);<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.set_transmit_fifo_empty(true);<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Self::from(0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .with_receive_fifo_emp=
ty(true)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .with_transmit_fifo_em=
pty(true)<br>
&gt;<br>
&gt; I guess skipping the mut is the advantage of being able to const eval.=
<br>
<br>
No you can actually have mut in const-eval. What you can&#39;t have is<br>
heap allocations and calling non-const functions, and some other<br>
things. But in this case it doesn&#39;t matter, because this is the<br>
Default trait and it&#39;s not const, because it&#39;s a trait method.<br>
<br>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; -#[bitsize(32)]<br>
&gt; &gt; -#[derive(Clone, Copy, DebugBits, FromBits)]<br>
&gt; &gt; +#[bitfield(u32)]<br>
&gt; &gt;=C2=A0 /// Line Control Register, `UARTLCR_H`<br>
&gt; &gt;=C2=A0 #[doc(alias =3D &quot;UARTLCR_H&quot;)]<br>
&gt; &gt;=C2=A0 pub struct LineControl {<br>
&gt; &gt; @@ -201,48 +201,46 @@ pub struct LineControl {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// PEN: Parity enable<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub parity_enabled: bool,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// EPS: Even parity select<br>
&gt; &gt; +=C2=A0 =C2=A0 #[bits(1)]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub parity: Parity,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// STP2: Two stop bits select<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub two_stops_bits: bool,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// FEN: Enable FIFOs<br>
&gt; &gt; +=C2=A0 =C2=A0 #[bits(1)]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub fifos_enabled: Mode,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// WLEN: Word length in bits<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// b11 =3D 8 bits<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// b10 =3D 7 bits<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// b01 =3D 6 bits<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// b00 =3D 5 bits.<br>
&gt; &gt; +=C2=A0 =C2=A0 #[bits(2)]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub word_length: WordLength,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// SPS Stick parity select<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub sticky_parity: bool,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// 31:8 - Reserved, do not modify, read as z=
ero.<br>
&gt; &gt; -=C2=A0 =C2=A0 _reserved_zero_no_modify: u24,<br>
&gt; &gt; +=C2=A0 =C2=A0 #[bits(24)]<br>
&gt; &gt; +=C2=A0 =C2=A0 _reserved_zero_no_modify: u32,<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; -impl_vmstate_bitsized!(LineControl);<br>
&gt; &gt; +impl_vmstate_forward!(LineControl);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 impl LineControl {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub fn reset(&amp;mut self) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // All the bits are cleared to =
0 when reset.<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *self =3D 0.into();<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *self =3D Self::default();<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; -impl Default for LineControl {<br>
&gt; &gt; -=C2=A0 =C2=A0 fn default() -&gt; Self {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 0.into()<br>
&gt; &gt; -=C2=A0 =C2=A0 }<br>
&gt; &gt; -}<br>
&gt; &gt; -<br>
&gt; &gt; -#[bitsize(1)]<br>
&gt; &gt; -#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]<br>
&gt; &gt;=C2=A0 /// `EPS` &quot;Even parity select&quot;, field of [Line Co=
ntrol<br>
&gt; &gt;=C2=A0 /// register](LineControl).<br>
&gt; &gt; +#[repr(u8)]<br>
&gt; &gt; +#[derive(Clone, Copy, Debug, Eq, PartialEq, qemu_api_macros::Try=
Into)]<br>
&gt; &gt;=C2=A0 pub enum Parity {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Odd =3D 0,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Even =3D 1,<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; -#[bitsize(1)]<br>
&gt; &gt; -#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]<br>
&gt; &gt; +#[repr(u8)]<br>
&gt; &gt; +#[derive(Clone, Copy, Debug, Eq, PartialEq, qemu_api_macros::Try=
Into)]<br>
&gt; &gt;=C2=A0 /// `FEN` &quot;Enable FIFOs&quot; or Device mode, field of=
 [Line Control<br>
&gt; &gt;=C2=A0 /// register](LineControl).<br>
&gt; &gt;=C2=A0 pub enum Mode {<br>
&gt; &gt; @@ -253,8 +251,8 @@ pub enum Mode {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 FIFO =3D 1,<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; -#[bitsize(2)]<br>
&gt; &gt; -#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]<br>
&gt; &gt; +#[repr(u8)]<br>
&gt; &gt; +#[derive(Clone, Copy, Debug, Eq, PartialEq, qemu_api_macros::Try=
Into)]<br>
&gt; &gt;=C2=A0 /// `WLEN` Word length, field of [Line Control register](Li=
neControl).<br>
&gt; &gt;=C2=A0 ///<br>
&gt; &gt;=C2=A0 /// These bits indicate the number of data bits transmitted=
 or received in a<br>
&gt; &gt; @@ -275,9 +273,8 @@ pub enum WordLength {<br>
&gt; &gt;=C2=A0 /// The `UARTCR` register is the control register. It conta=
ins various<br>
&gt; &gt;=C2=A0 /// enable bits, and the bits to write to set the usual out=
bound RS232<br>
&gt; &gt;=C2=A0 /// modem control signals. All bits reset to 0 except TXE a=
nd RXE.<br>
&gt; &gt; -#[bitsize(32)]<br>
&gt; &gt; +#[bitfield(u32, default =3D false)]<br>
&gt; &gt;=C2=A0 #[doc(alias =3D &quot;UARTCR&quot;)]<br>
&gt; &gt; -#[derive(Clone, Copy, DebugBits, FromBits)]<br>
&gt; &gt;=C2=A0 pub struct Control {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// `UARTEN` UART enable: 0 =3D UART is disab=
led.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub enable_uart: bool,<br>
&gt; &gt; @@ -285,9 +282,10 @@ pub struct Control {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// QEMU does not model this.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub enable_sir: bool,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// `SIRLP` SIR low-power IrDA mode. QEMU doe=
s not model this.<br>
&gt; &gt; -=C2=A0 =C2=A0 pub sir_lowpower_irda_mode: u1,<br>
&gt; &gt; +=C2=A0 =C2=A0 pub sir_lowpower_irda_mode: bool,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// Reserved, do not modify, read as zero.<br=
>
&gt; &gt; -=C2=A0 =C2=A0 _reserved_zero_no_modify: u4,<br>
&gt; &gt; +=C2=A0 =C2=A0 #[bits(4)]<br>
&gt; &gt; +=C2=A0 =C2=A0 _reserved_zero_no_modify: u8,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// `LBE` Loopback enable: feed UART output b=
ack to the input<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub enable_loopback: bool,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /// `TXE` Transmit enable<br>
&gt; &lt;snip&gt;<br>
&gt;<br>
&gt; I guess I&#39;m not seeing a massive difference here. I guess the cons=
t eval<br>
&gt; is nice but there is cognitive dissonance having annotations not match=
<br>
&gt; types. It would be nice to have the best of both worlds.<br>
&gt;<br>
&gt; For now I don&#39;t see a compelling reason to change from a standard =
crate<br>
&gt; (which I guess is the reason this is an RFC ;-)<br>
&gt;<br>
&gt; --<br>
&gt; Alex Benn=C3=A9e<br>
&gt; Virtualisation Tech Lead @ Linaro<br>
<br>
-- <br>
Manos Pitsidianakis<br>
Emulation and Virtualization Engineer at Linaro Ltd<br>
<br>
</blockquote></div></div></div>

--0000000000008b313b0635a5b3b2--


