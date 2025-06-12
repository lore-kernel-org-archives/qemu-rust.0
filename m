Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uPf7P-0006OQ-MJ
	for mharc-qemu-rust@gnu.org; Thu, 12 Jun 2025 06:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPf7K-0006L6-J8
 for qemu-rust@nongnu.org; Thu, 12 Jun 2025 06:25:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPf7G-00076u-EK
 for qemu-rust@nongnu.org; Thu, 12 Jun 2025 06:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749723898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qEgrlhjN92FBcMwIxakpxjD1PBIpMBBDOC8SPelF25U=;
 b=BAfXz4lFoeRGxOouKriK2D09BSn7u7Ya+SW/bmcqncMu5S1WJXHm84sZyc47PNrTN/mIrq
 eQwYp27mZ6vT3G3gBDgt/R37Dj1slCvKR9oqthgXBRzC7gN4ZyaykuwEte4nvw/Lgiws4t
 dp+j2tgxA4mBujn+4VZPigoBQqGHTqE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-qwncHSTGOluUoIH0-y_1LA-1; Thu, 12 Jun 2025 06:24:57 -0400
X-MC-Unique: qwncHSTGOluUoIH0-y_1LA-1
X-Mimecast-MFC-AGG-ID: qwncHSTGOluUoIH0-y_1LA_1749723896
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-451d7de4ae3so4466255e9.2
 for <qemu-rust@nongnu.org>; Thu, 12 Jun 2025 03:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749723896; x=1750328696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qEgrlhjN92FBcMwIxakpxjD1PBIpMBBDOC8SPelF25U=;
 b=I8Qu4EW/W2Cd2bLDzEZt+xDndFo96Vkq4c3R+FROjl/v8Y5p0LdKceaOhbPrsGH/93
 hQXFpAybN6NmBW9olKbsj4Qp+BMOTMSwtbm3whjR6Ee47KI/8G4PKxrwGzs2gldkv7ge
 XGYxPoavOmv1VMZNAaBmh+ykSXz+WhpYwphb4pSM5WdGapq2sQhG85m5if6PCXKigdSH
 pUFnIhEX8EaqLjDDCeURey/NqEtpvGEBkIGGBX8onZ0At8dLPiRqqwSrw9x4KpbPb475
 BKAxKxWXZzGM1SEKitMEOMQGvh/w2nB0BkodQjyKx1N4+zAhzhjyCFByNeRkEUSKSkG6
 u5fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfhIOB+M2I8zVQjKw0ptZcm2/zGLTHH91GSVHVyTFmO1rmhagsqMWvH3t8WTizQNt9Oo2Hj7MOeyo=@nongnu.org
X-Gm-Message-State: AOJu0YwT2OgmDukxrvLNK117FgxeG2qBHwP1QOCGTGvhNa5aLXNNic2b
 Q+Bpo8+pN6CZgDSvQ7lhR5OnEJvTyW14Kx1SWA1qM46D5XzJpYoLx8JhFaDjs08riN/bgnhuhm+
 0SA6Ml3MG+XEW0I/HPaUVzz8Tg8niwzc/vKilr/lfcfNZ4bVJ7keZGU32EWKTpnEa0q3Ydw7dTJ
 id/x5OVDwagHcfa8CElfkplvyC7/Wjww==
X-Gm-Gg: ASbGncs/ObdRpyBO/JdakH7F6gpufPjjCb+7C3KgJKIOEuUmQEElJcbptF9dtl6WSEy
 htIU64eObmZKt6WtcBz1GMrkOsQs+2hnmsr8df9aXk/0pEmB1gtUJK2pXnT07V2MVezqVlLTIol
 ycvSU=
X-Received: by 2002:a05:600c:c16f:b0:453:c39:d0a7 with SMTP id
 5b1f17b1804b1-4532b89f884mr31035255e9.5.1749723896107; 
 Thu, 12 Jun 2025 03:24:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGngaTDMGf8NuTuFr3mU5qBj8FJincuePOUNWSV3WOhdX2dxUZjThAtebGnQDal9szZudMqKe1j8OsaB4kN76Y=
X-Received: by 2002:a05:600c:c16f:b0:453:c39:d0a7 with SMTP id
 5b1f17b1804b1-4532b89f884mr31035045e9.5.1749723895722; Thu, 12 Jun 2025
 03:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250605101124.367270-1-pbonzini@redhat.com>
 <aEk6vdosWZgyQGXD@intel.com>
 <CABgObfaK8h3GE4GWbPrn22JshYcCFdXsxWHWuAPVC4pRb7GZ0A@mail.gmail.com>
In-Reply-To: <CABgObfaK8h3GE4GWbPrn22JshYcCFdXsxWHWuAPVC4pRb7GZ0A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Jun 2025 12:24:44 +0200
X-Gm-Features: AX0GCFuEzO8zgdw5MudUQOuwPC6sDysENa6QHxcQX9ophrZ25Hao1Iimp8yNNdE
Message-ID: <CABgObfa+w3pcYhFnO6ETxSfoNiNU=+_8WcW6dE8dkUrbt6darw@mail.gmail.com>
Subject: Re: [PATCH preview 0/3] reviving minimal QAPI generation from 2021
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, qemu-rust@nongnu.org, 
 armbru@redhat.com, mkletzan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RN46kqzXFqa0TnouSnZMSSWyZ5-eDbSfV8yHfL1tCpg_1749723896
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 12 Jun 2025 10:25:08 -0000

On Wed, Jun 11, 2025 at 10:57=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
> Yes. If using serde the implementation of the traits is very small,
> and basically the same for all types. If not using serde, it would
> need some (or most) of the infrastructure in Marc-Andr=C3=A9's original
> series.

Looking more at it, the Rust->QObject and QObject->Rust parts *can* be
done with serde (following the model of serde_json's Value
(de)serializer) but the Rust<->C part has a problem.

To recap, Rust->C is the serialization and corresponds to output
visitors. C->Rust is the deserialization and corresponds to input
visitors.

For serialization, serde has a push model where the generated code
looks like this:

      let mut state =3D
          Serializer::serialize_struct(serializer, "S", 2);
      SerializeStruct::serialize_field(&mut state, "a", &self.a)?;
      SerializeStruct::serialize_field(&mut state, "b", &self.b)?;
      SerializeStruct::end(state)

whereas QAPI has a pull model where visit_type_* drives the process
and requests the fields one by one.

For deserialization, serde has a pull model where the generated code
asks for the field names one by one:

    fn visit_map<__A>(self, mut __map: __A)
        while let Some(key) =3D
            MapAccess::next_key::<__Field>(&mut __map)? {
                match __key { ... }
        }
    }

whereas QAPI has a push model where visit_type_* again drives the
process and sends fields one by one.

For commands this is not a problem because the real underlying
transformation is QObject->QObject and the intermediate steps (to and
from QObject) can use serde.

However, QOM property getters/setters (especially, but not
exclusively, for properties with compound types) remain a problem
since these use callbacks with a Visitor* argument. I see three
possibilities:

1) everything is done through an intermediate QObject step (e.g. for a
setter: Visitor->QObject with an input visitor, and QObject->Rust with
serde deserialization).
    + easy, Rust only sees serde
    + QMP commands use a single conversion step
    - inefficient

2) everything is done through an intermediate C step (e.g. for a
setter: Visitor->C with a visit_type_* function, and C->Rust with
generated code that does not need to use serde). There is still a
double conversion step, but it's more efficient than option 1
    + one framework (visitor)
    - double conversion for the QMP commands
    - lots of generated code

3) generating a Rust visit_type_* implementation as well, either in
qapi-gen (3a) or through a procedural macro (3b). This should not be
hard to write but it would remove a lot of the advantages from using
serde.
    + efficient
    + preserves single conversion for QMP commands
    - two frameworks

I am leaning towards option 1, i.e. keep using serde but only cover
conversions to and from QObject. The reason is that one future usecase
for Rust in QEMU is the UEFI variable store; that one also has some
Rust<->JSON conversions and could be served by either QObject or
serde_json. Either way, it'd be nice for the UEFI variable store to
remain within the Rust serde ecosystem and allow sharing code between
QEMU and Coconut SVSM. But I'm not so sure...

Paolo


