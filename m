Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tCdGl-0006oN-WE
	for mharc-qemu-rust@gnu.org; Sun, 17 Nov 2024 06:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tCdGj-0006na-H5
 for qemu-rust@nongnu.org; Sun, 17 Nov 2024 06:16:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tCdGg-00041h-VH
 for qemu-rust@nongnu.org; Sun, 17 Nov 2024 06:16:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731842197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Akw0Jpsvyllf2/gLpC1tMXDGBC/KDHr+UbcU6YPA/WU=;
 b=HNBgw8+RAOMSxadBs7NnmIsosyT/cS1Nee3bKZDA8ogyDHxdxqd8/seISRVEMUzuyIj3a+
 EyJoXAC6Ie6XjI4nC5IavRZyh90VjTxCLr54HJyiZdGkB84GbuoqZJyZVO6UGFMu5uN8oc
 gq+zmQK8JZbtwr0r2nN0Zh2V275p8H4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-V4ELnNP9N9-r737Z8ENOSQ-1; Sun, 17 Nov 2024 06:16:32 -0500
X-MC-Unique: V4ELnNP9N9-r737Z8ENOSQ-1
X-Mimecast-MFC-AGG-ID: V4ELnNP9N9-r737Z8ENOSQ
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-382440c1f83so98588f8f.1
 for <qemu-rust@nongnu.org>; Sun, 17 Nov 2024 03:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731842191; x=1732446991;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Akw0Jpsvyllf2/gLpC1tMXDGBC/KDHr+UbcU6YPA/WU=;
 b=sQbEq/sa9TB/IrUbzVaJTMR7i+PKeRbcUXb6vWZv/Zp124rJvrFsqIK6gvO/ZODLup
 t2h7o7HYbSZmR/iPQahpP0KzRWEn8wUPyxMphzvYAN/1Kh0vw1cPKtDkQZ3XMPP6bIsb
 kAeCRFszqwV5T0saRE8z3RSGxn79XnI1ZqDkp9l9B3EyCt0OOxVAn8VFjINck+QwneMD
 g9wFZV4GO+b13ojVj9MPGznEfLd4xOLzGfBIGqg1Zft1RqUjEAwe/FJ3aufOEJVWQw7C
 m/yTAEOK2WnXAf+HBm+6SIaA++gpKEWfXM+L6mgD1xzUg2tZezAp+ieARUh90zlJdqO2
 3MjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/bJp9Gyu+wembChkPDrEq7QcT5yNEoiEYu2JTAs3cPsETYU4piMlm7gW0759FmjqCHuBXs/vLNN0=@nongnu.org
X-Gm-Message-State: AOJu0Yzpjpp7WkFMlO5/RuODLEDte+HSmwvtCkMcNHd8I5SgUkHmY2TR
 8HURWy+ilqfObgjmTlHhsYfXH3Hc0r9XMlPCMcMel2IgshCR5Vg20uEwmHlRWY4o6uFpdlkP62p
 dFLxAicchI1H52HEvhcvVG618PXCFUoAra77IEPihmRVgFMvEEjarlBDp5hwWygMnfKfMVJK/VY
 vCVjo0inbr4FtSSGGGp+yFmHpTXA==
X-Received: by 2002:a5d:59a2:0:b0:37d:47ef:17d0 with SMTP id
 ffacd0b85a97d-38224f861c6mr7780338f8f.13.1731842190818; 
 Sun, 17 Nov 2024 03:16:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsq/Rt+FvkdfdzUjIPzwKKJw2/70evih/TGHOMIubDLE9+WyIiWflyt489kYjOz4x8v5efk+1Ld9aK48Z8VNo=
X-Received: by 2002:a5d:59a2:0:b0:37d:47ef:17d0 with SMTP id
 ffacd0b85a97d-38224f861c6mr7780320f8f.13.1731842190516; Sun, 17 Nov 2024
 03:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20241116221757.3501603-1-manos.pitsidianakis@linaro.org>
 <CAFEAcA9m7EnMX+=T0TL2R_NCJqaPUPCUcoYzAo4P2oRUZbM6Kg@mail.gmail.com>
 <CAAjaMXZE+KKJnvcMpmpaH+dmO7MQVmJm7pD+i1yo_5Wb9-ERcQ@mail.gmail.com>
In-Reply-To: <CAAjaMXZE+KKJnvcMpmpaH+dmO7MQVmJm7pD+i1yo_5Wb9-ERcQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 17 Nov 2024 12:16:16 +0100
Message-ID: <CABgObfadfaohQNf5AheVAUSL5G8i9+zeTOwXRPhOwC_6NpTvmQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust/pl011: Fix DeviceID reads
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 "open list:ARM SMMU <qemu-arm@nongnu.org>, " <qemu-devel@nongnu.org>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, qemu-rust@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PCxWyYxdAAd4tD5nrzNYs0eVHX5QqkqS6BCmdMCoRT8_1731842191
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000092c2d5062719ee65"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.121,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 17 Nov 2024 11:16:41 -0000

--00000000000092c2d5062719ee65
Content-Type: text/plain; charset="UTF-8"

Il dom 17 nov 2024, 11:21 Manos Pitsidianakis <
manos.pitsidianakis@linaro.org> ha scritto:

> This seems extremely verbose and rather obscures the fact that these
>> registers are a set of adjacent simple ID registers, compared to
>> the previous code which defined them as an array of values.
>
>
> One could abstract them with declarative macros to reduce the line count.
> WDYT about that approach?
>

No, this is just overcomplicating things. Like Peter said, just use arrays.
Copying from the V1 review for reference:

     const UART_PCELL_ID: [u8; 4] = [0x0d, 0xf0, 0x05, 0xb1];
     const ARM_UART_PERIPH_ID: [u8; 4] = [0x11, 0x10, 0x14, 0x00];
     const LUMINARY_UART_PERIPH_ID: [u8; 4] = [0x11, 0x00, 0x18, 0x01];

     /// Value of `UARTPeriphID0` through `UARTPeriphID3` registers
     const fn uart_periph_id(&self, idx: usize) -> u8 {
         match self {
             Self::Arm => ARM_UART_PERIPH_ID,
             Self::Luminary => LUMINARY_UART_PERIPH_ID,
         }[idx]
     }

     /// Value of `UARTPCellID0` through `UARTPCellID3` registers
     const fn uart_pcell_id(idx: usize) -> u8 {
         Self::UART_PCELL_ID[idx]
     }

Paolo

>

--00000000000092c2d5062719ee65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">Il dom 17 nov 2024, 11:21 Manos Pitsidianakis=
 &lt;<a href=3D"mailto:manos.pitsidianakis@linaro.org">manos.pitsidianakis@=
linaro.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"auto"><div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">This seems extremely verbose and ra=
ther obscures the fact that these<br>
registers are a set of adjacent simple ID registers, compared to<br>
the previous code which defined them as an array of values.</blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">One could abstract t=
hem with declarative macros to reduce the line count. WDYT about that appro=
ach?</div></div></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><div dir=3D"auto">No, this is just overcomplicating things. Like Pete=
r said, just use arrays. Copying from the V1 review for reference:</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0const UART_P=
CELL_ID: [u8; 4] =3D [0x0d, 0xf0, 0x05, 0xb1];</div><div dir=3D"auto">=C2=
=A0 =C2=A0 =C2=A0const ARM_UART_PERIPH_ID: [u8; 4] =3D [0x11, 0x10, 0x14, 0=
x00];</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0const LUMINARY_UART_PERIPH=
_ID: [u8; 4] =3D [0x11, 0x00, 0x18, 0x01];</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0/// Value of `UARTPeriphID0` through=
 `UARTPeriphID3` registers</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0const=
 fn uart_periph_id(&amp;self, idx: usize) -&gt; u8 {</div><div dir=3D"auto"=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match self {</div><div dir=3D"auto">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Self::Arm =3D&gt; ARM_UART_PER=
IPH_ID,</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Self::Luminary =3D&gt; LUMINARY_UART_PERIPH_ID,</div><div dir=3D"auto=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}[idx]</div><div dir=3D"auto">=C2=A0 =
=C2=A0 =C2=A0}</div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0 =
=C2=A0 =C2=A0/// Value of `UARTPCellID0` through `UARTPCellID3` registers</=
div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0const fn uart_pcell_id(idx: usize=
) -&gt; u8 {</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Self:=
:UART_PCELL_ID[idx]</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0}</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><div class=3D"gma=
il_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"auto"><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
</blockquote></div></div></div>
</blockquote></div></div>

--00000000000092c2d5062719ee65--


