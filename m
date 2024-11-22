Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEP5y-0002sZ-HS
	for mharc-qemu-rust@gnu.org; Fri, 22 Nov 2024 03:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tEP5x-0002s2-1a
 for qemu-rust@nongnu.org; Fri, 22 Nov 2024 03:32:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tEP5v-00019w-BJ
 for qemu-rust@nongnu.org; Fri, 22 Nov 2024 03:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732264370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vPgKYAovHm8G1oDfssARv2jTiR4Utk7GrWumL6zELeQ=;
 b=UHZ8pxu0+7EfwBSiyydLkVJsHLbGef7ZyfZadl/y3lcng+F6INom+Gl4kaIe4XyOttiBMC
 RDenUl+hpXcv0EvG01XdCRjLtPq7hXl/kGThRh1exFwagikr2OXnX9r/0iwFMKkWdXnnZe
 oJDWiHdFCy6IOlm3qpXlx1XAqX6c9L0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-2SmmoU8pM7uWgVkPtubMCw-1; Fri, 22 Nov 2024 03:32:45 -0500
X-MC-Unique: 2SmmoU8pM7uWgVkPtubMCw-1
X-Mimecast-MFC-AGG-ID: 2SmmoU8pM7uWgVkPtubMCw
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-539fb5677c9so1699691e87.0
 for <qemu-rust@nongnu.org>; Fri, 22 Nov 2024 00:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732264363; x=1732869163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vPgKYAovHm8G1oDfssARv2jTiR4Utk7GrWumL6zELeQ=;
 b=s1rEuks5dxOlYZcVe0Z0xwWHxzjar+mvApbSUhoPJdLTIl6J/iXb0vS1vq/+oWqJ6p
 LyXOrlOawx/o8KmviJjcrokWh3U6FzgeFg/fcwt2attJU1nh1L/CRbs4Ead0CWF3JUfP
 Feaa93JHtENS1umcFqWESlQKHfqpvyEx9RwbmQjrDvtfLbIlRYekoRzEee5isno0CYF5
 CbGlW0XoWex3FeZf0dqPwlefhS2sQXJiKQhuvZcge4B9GLgIeVSLTbwtOnBmmqpqpkTD
 Mes9NouYg8eVhpJu2/galFIjR/zIi9rG/L6gUOllx/mdx8pe2s3v4EEnW0O6H5mUNPtZ
 RTWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUawhOdcPXLakVNFzvg4EBZ7Ji5aIlmUelDRIj1TaNT4bNx1QVsOwDec3cTfr6ptGqlelXUCsGybCw=@nongnu.org
X-Gm-Message-State: AOJu0YwVFxxWsMBXrRx7+PH7i9Lc56J3gKtRaGYmJxlCHkua8nxwDgl6
 6Gfv9OR4/7K6Uu7TIsqNTcYhnIpcXzRN3Ip1FrSPp/32lG+/dKriwaycHcZgHaG5/gG5Q/hUIbF
 Muvn0w6yqErMCCLi6FawxqK0fH4kuzr7zYzTINdru8a7XcC7ZHy4zTIcioohgLrtwHBsNSutb9f
 Wo4ObN1dVTaBuIRDYyShGipMNOVQ==
X-Gm-Gg: ASbGnctKuXvBSL8ZMDoATT8bCOTKEW9dd/Ipkk8GY3fdJ3YOjjP5vm12YMwIn8pyPbY
 qCf68iyQrf+XLdkJbQbevfWaD2O+M71lD
X-Received: by 2002:a05:6512:32c9:b0:53d:c63e:beae with SMTP id
 2adb3069b0e04-53dd3aabef3mr849395e87.53.1732264363315; 
 Fri, 22 Nov 2024 00:32:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqqVf7csmeTnGDHbZ0CZ97gCX7Xxkmbyxuw3LsaUI+9Sx8Nrk+8uz4yz1wG8qTHr/V5TZRyBbXFyza1JhEE5A=
X-Received: by 2002:a05:6512:32c9:b0:53d:c63e:beae with SMTP id
 2adb3069b0e04-53dd3aabef3mr849383e87.53.1732264362976; Fri, 22 Nov 2024
 00:32:42 -0800 (PST)
MIME-Version: 1.0
References: <20241122074756.282142-1-pbonzini@redhat.com>
 <20241122074756.282142-3-pbonzini@redhat.com>
 <70f44731-6879-4adf-a71b-a781af48fe99@linaro.org>
In-Reply-To: <70f44731-6879-4adf-a71b-a781af48fe99@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 22 Nov 2024 09:32:30 +0100
Message-ID: <CABgObfbOj8FCvjXOM_AF8=jyFMi1bs-gfsRu+_GH3802hLhM1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: add bindings for interrupt sources
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, junjie.mao@hotmail.com, zhao1.liu@intel.com, 
 qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7Hvstvh101K3nFKt7VVavaG3dd69fVWoXQpO0ylxQSs_1732264363
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.14,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 22 Nov 2024 08:32:53 -0000

> > +/// Interrupt sources are used by devices to pass changes to a boolean value to
> > +/// other devices (typically interrupt or GPIO controllers).  QEMU interrupt
> > +/// sources are always active-high.
>
> So 'always active-high' = true below? (Wondering about pulsation, if the
> true -> false transition is always correct).

Yeah, I mean that raise uses true (or 1 :)) and lower uses false.
an example?

> Is this deliberate to restrict the Rust binding to boolean? (Maybe you
> envision a VectoredInterruptSource implementation for that).

No, I simply wasn't aware of that.  I'll adjust; do you have
an example?

> > +/// Interrupt sources can only be triggered under the Big QEMU Lock; they are
> > +/// neither `Send` nor `Sync`.

Oops, this is incorrect.  BqlCell *is* Send/Sync, but checks the
BQL state at run-time.

Paolo


