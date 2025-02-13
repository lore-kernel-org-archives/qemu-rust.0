Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiX36-0003vK-9g
	for mharc-qemu-rust@gnu.org; Thu, 13 Feb 2025 06:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiX33-0003uU-Dw
 for qemu-rust@nongnu.org; Thu, 13 Feb 2025 06:06:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiX31-0007Lm-L4
 for qemu-rust@nongnu.org; Thu, 13 Feb 2025 06:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739444781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1eZkYUBFWEylhK7h3h1cAdHlAvv4y8qvqeiH+U1ebA=;
 b=AiVntsqbrCC+28XXzpi+CRAs19mR3sEJwbmvmSDBEujN8CvQVx4jaThn+2HZl9j4HcDncQ
 ETIn6MFwZcEFSJcE1jLKmUqCpjjeuu/SF06UVuyMzOw0qaOufojexMi8StQi7PltKAQ65Y
 JJm2qInC3uS69Vtzz6og+U8Z6/RoQA8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-zyWsAGEkPMujCLapToxprA-1; Thu, 13 Feb 2025 06:06:20 -0500
X-MC-Unique: zyWsAGEkPMujCLapToxprA-1
X-Mimecast-MFC-AGG-ID: zyWsAGEkPMujCLapToxprA
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38ddcb63ed1so497581f8f.1
 for <qemu-rust@nongnu.org>; Thu, 13 Feb 2025 03:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739444779; x=1740049579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1eZkYUBFWEylhK7h3h1cAdHlAvv4y8qvqeiH+U1ebA=;
 b=OL/6qxgUoNHRxUxxg5ZNAAm9kXpMfB3QhMm2exjiVLClskkBsFSll6kTZZJeq8MMPS
 7C2mUCHz1NcsEtl/L8JvUa2RrczdnXrMaS1jvCmgFHELG4RWmbNp4/BQ8RryRYLED4Lh
 5ElUujmULzF7NfA8JhP5XtCaDT/DXTT5NzENvBEl/Ff+2yQsmtGfTzaRWWc6ESmdnC/y
 ZUAm53csL8cgb6Nb0eBAT6HM7ZUr9Rb1ZX+jjNA9UBN5BGWqIZWbbBEpniVHrhumIVe4
 pgTYlO/VX9Ak21C3K02iAOM3X7Y764BPeEfM8T3EELUfbwwsGu+O9WyT2et6Umj3OPxu
 d05w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjnsLYinoTkWWeTrsOK+jwR8jE5zPalRRLWp/W6kDCYqQBc2+8SxovF6958rJchVJe61whuRnYzLU=@nongnu.org
X-Gm-Message-State: AOJu0YyCh82sy3xOZ6SykT/MwQAMQRN4GS9vinMwtkFcEndHZZdyO86a
 gV7Kx9LJxAOVVlsS3DKgBSsXxQ2//B3HlbaVTIK1337I4FSGG5x7TyjaK4uYF96waY+uvqKDhpt
 cqCmdrDhmwP5h02Xd4rHXuqmv061V9SwHKj6qmDJl8NePXZ7fe5RysROL8RnTOkrPHCqUpeJ7UH
 NKlnVqH0m4Uoxy6s/k3eQhDYX3Yw==
X-Gm-Gg: ASbGncuJP5OqXZ4c8hy+a+3apDqWPTpZLdLB8wisvHkhxkyvbXN4Bnyy7iqgSYPr+OQ
 wJ4I///AiemKi5531MbSkxooI7J+o9bwJyH/CmJePkFoG+OlpqQTKLIHJlxBBe+c=
X-Received: by 2002:a05:6000:2a5:b0:385:fa3d:1988 with SMTP id
 ffacd0b85a97d-38dea259847mr6293837f8f.8.1739444778680; 
 Thu, 13 Feb 2025 03:06:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYr43NmskIRpGzWJaeWz7wCmCCe8Hu7UIN86ZICwpEwYS9yXLnh/Py7ZwtNJJ53O7wZPmtj94BWcWaFN8kEt0=
X-Received: by 2002:a05:6000:2a5:b0:385:fa3d:1988 with SMTP id
 ffacd0b85a97d-38dea259847mr6293805f8f.8.1739444778289; Thu, 13 Feb 2025
 03:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20250211214328.640374-1-kwolf@redhat.com>
 <20250211214328.640374-4-kwolf@redhat.com>
 <b7b2ab97-acd3-4008-abd6-3da874541113@redhat.com>
 <Z6yecuOmtQKYUwLj@redhat.com>
 <CABgObfb-MXHYY4eM5LUbiRdOqWFG_CEcM-Xkv+v_dNWMwThKHA@mail.gmail.com>
 <Z6y6nUo68dIkryOu@redhat.com>
 <a8e79f73-15d0-486c-99da-ad871a57e4ef@redhat.com>
 <Z6z8EuH2Dw0SQfME@redhat.com>
In-Reply-To: <Z6z8EuH2Dw0SQfME@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 13 Feb 2025 12:06:06 +0100
X-Gm-Features: AWEUYZkO6A78NSkQaCcDeD_mY9pMQFl9ODNt25Jn-yWMGTa7lXw7FpDnE-tJr_M
Message-ID: <CABgObfadubwF0u50dR60g3aYDaZZsbxsSfm2PaY-je2GV7Fm2g@mail.gmail.com>
Subject: Re: [PATCH 03/11] rust: Add some block layer bindings
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, manos.pitsidianakis@linaro.org, 
 qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VOFAh4FyE8Mh0MVCjm-zNcqn91V5yYcS2HPK0NAWZcw_1739444779
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 13 Feb 2025 11:06:26 -0000

On Wed, Feb 12, 2025 at 8:52=E2=80=AFPM Kevin Wolf <kwolf@redhat.com> wrote=
:
> I assume that sooner or later we'll have a reason to include it anyway,
> so that might honestly be the best option.

Sounds good.

> Do you want to post it as a proper patch? It seems to depend on your
> errno patch, but that shouldn't be a problem because we still want that
> one, too.

Yes, I wrote it as an addendum, as a kind of "let's see later what's
best"; that's also why the patch I posted uses "mod libc" for the
errno values.  (The attachment gives away the date, too :)).  I'll
clean up everything and add errno::into_neg_errno(); it should take
both an unsigned Ok value or Ok(()), and will return i32 or i64.

Paolo


